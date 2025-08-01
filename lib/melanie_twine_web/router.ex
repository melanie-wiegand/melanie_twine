defmodule MelanieTwineWeb.Router do
  use MelanieTwineWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug MelanieTwineWeb.Plugs.SetLocale
    plug :put_root_layout, html: {MelanieTwineWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    # plug MelanieTwineWeb.Plugs.SetLocale
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MelanieTwineWeb do
    pipe_through :browser


    live_session :default, on_mount: MelanieTwineWeb.Live.SetLocale do
      live "/", HomePageLive
      live "/integrations", IntegrationsLive
      live "/offer", OfferLive
      live "/security", SecurityLive
      live "/current", CurrentLive
      live "/about", AboutLive
      live "/contact", ContactLive
    end
  end

  # Other scopes may use custom stacks.
  # scope "/api", MelanieTwineWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:melanie_twine, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: MelanieTwineWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
