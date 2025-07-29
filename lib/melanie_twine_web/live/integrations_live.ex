defmodule MelanieTwineWeb.IntegrationsLive do
  use MelanieTwineWeb, :live_view

  on_mount MelanieTwineWeb.Live.SetLocale

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

end
