defmodule IndieLedger.Repo do
  use Ecto.Repo,
    otp_app: :indie_ledger,
    adapter: Ecto.Adapters.Postgres
end
