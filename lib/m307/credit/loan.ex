defmodule M307.Credit.Loan do
  use Ecto.Schema
  import Ecto.Changeset

  schema "loans" do
    field :email, :string
    field :name, :string
    field :phone, :string
    field :rate_count, :integer
    field :status, Ecto.Enum, values: [:open, :closed]
    field :credit_package, :id

    timestamps()
  end

  @doc false
  def changeset(loan, attrs) do
    loan
    |> cast(attrs, [:name, :email, :phone, :rate_count, :status])
    |> validate_required([:name, :email, :phone, :rate_count, :status])
  end
end
