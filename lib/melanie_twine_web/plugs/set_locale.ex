defmodule MelanieTwineWeb.Plugs.SetLocale do
  import Plug.Conn

  def init(opts), do: opts

  def call(conn, _opts) do
    lang = conn.params["lang"] || "sv"
    Gettext.put_locale(MelanieTwineWeb.Gettext, lang)
    assign(conn, :locale, lang)
  end
end