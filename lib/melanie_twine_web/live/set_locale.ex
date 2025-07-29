defmodule MelanieTwineWeb.Live.SetLocale do
  def on_mount(_assigns, %{"lang" => lang}, _session, socket) do
    Gettext.put_locale(MelanieTwineWeb.Gettext, lang)
    {:cont, Phoenix.Component.assign(socket, :locale, lang)}
  end

  def on_mount(_assigns, _params, _session, socket) do
    lang = "sv"
    Gettext.put_locale(MelanieTwineWeb.Gettext, lang)
    {:cont, Phoenix.Component.assign(socket, :locale, lang)}
  end
end
