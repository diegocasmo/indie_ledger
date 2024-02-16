defmodule IndieLedger.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      IndieLedgerWeb.Telemetry,
      IndieLedger.Repo,
      {DNSCluster, query: Application.get_env(:indie_ledger, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: IndieLedger.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: IndieLedger.Finch},
      # Start a worker by calling: IndieLedger.Worker.start_link(arg)
      # {IndieLedger.Worker, arg},
      # Start to serve requests, typically the last entry
      IndieLedgerWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: IndieLedger.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    IndieLedgerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
