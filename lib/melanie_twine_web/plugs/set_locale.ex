defmodule MelanieTwineWeb.Plugs.SetLocale do
  import Plug.Conn
  import Gettext

  def init(default), do: default

  def call(conn, _opts) do
    locale = get_locale_from_params(conn.params)
    Gettext.put_locale(YourAppWeb.Gettext, locale)
    conn
  end

  defp get_locale_from_params(%{"lang" => lang}) when lang in ["en", "sv"], do: lang
  defp get_locale_from_params(_), do: "en"  # default
end