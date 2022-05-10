defmodule M307.Repo.Migrations.CreateLoans do
  use Ecto.Migration

  def change do
    create table(:loans) do
      add :name, :string
      add :email, :string
      add :phone, :string
      add :rate_count, :integer, null: false
      add :status, :string
      add :credit_package, references(:credit_packages, on_delete: :nothing)

      timestamps()
    end

    create index(:loans, [:credit_package])
  end
end
