defmodule IndieLedgerWeb.PageController do
  use IndieLedgerWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end
end
