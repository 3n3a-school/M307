defmodule M307.Repo.Migrations.CreateCreditPackages do
  use Ecto.Migration

  def change do
    create table(:credit_packages) do
      add :name, :string

      timestamps()
    end
  end
end
