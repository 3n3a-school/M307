defmodule M307.Credit.Package do
  use Ecto.Schema
  import Ecto.Changeset

  schema "credit_packages" do
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(package, attrs) do
    package
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
