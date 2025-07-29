defmodule MelanieTwineWeb.PageController do
  use MelanieTwineWeb, :controller
  import Phoenix.LiveView.Controller, only: [live_render: 3]


  def index(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    # render(conn, :home, layout: false)
    live_render(conn, MelanieTwineWeb.HomePageLive, session: %{})
  end
end
