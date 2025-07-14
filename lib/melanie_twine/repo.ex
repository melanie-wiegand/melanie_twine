defmodule MelanieTwine.Repo do
  use Ecto.Repo,
    otp_app: :melanie_twine,
    adapter: Ecto.Adapters.Postgres
end
