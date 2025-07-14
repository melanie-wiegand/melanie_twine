defmodule MelanieTwine.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      MelanieTwineWeb.Telemetry,
      MelanieTwine.Repo,
      {DNSCluster, query: Application.get_env(:melanie_twine, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: MelanieTwine.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: MelanieTwine.Finch},
      # Start a worker by calling: MelanieTwine.Worker.start_link(arg)
      # {MelanieTwine.Worker, arg},
      # Start to serve requests, typically the last entry
      MelanieTwineWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: MelanieTwine.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    MelanieTwineWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
