# IndieLedger

Track and manage your creative finances.

## Installation

- **Install asdf:**
  - [asdf](https://github.com/asdf-vm/asdf)

- **Install asdf plugins:**
  - `asdf plugin add erlang`
  - `asdf plugin add elixir`
  - `asdf plugin add postgres`
  - `asdf plugin add nodejs`

- **Run asdf install:**
  ```bash
  asdf install
  ```

- **Create a `config/dev.secret.exs` file and configure your database credentials:**
  ```elixir
  # config/dev.secret.exs

  import Config

  config :indie_ledger, IndieLedger.Repo,
    username: "your_username",
    password: "your_password",
    database: "your_dev_database",
    hostname: "localhost"
  ```

- **Install dependencies:**
  ```bash
  mix deps.get
  ```

- **Create and migrate the database:**
  ```bash
  mix ecto.create
  mix ecto.migrate
  ```

- **Start the Phoenix server:**
  ```bash
  mix phx.server
  ```
