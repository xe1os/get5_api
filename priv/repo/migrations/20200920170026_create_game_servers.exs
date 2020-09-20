defmodule Get5Api.Repo.Migrations.CreateGameServers do
  use Ecto.Migration

  def change do
    create table(:game_servers, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :host, :integer
      add :port, :string
      add :rcon_password, :string

      timestamps()
    end

  end
end
