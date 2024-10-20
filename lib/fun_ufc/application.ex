defmodule FunUfc.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      FunUfcWeb.Telemetry,
      FunUfc.Repo,
      {DNSCluster, query: Application.get_env(:fun_ufc, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: FunUfc.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: FunUfc.Finch},
      # Start a worker by calling: FunUfc.Worker.start_link(arg)
      # {FunUfc.Worker, arg},
      # Start to serve requests, typically the last entry
      FunUfcWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: FunUfc.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    FunUfcWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
