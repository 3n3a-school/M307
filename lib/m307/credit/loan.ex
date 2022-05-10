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
    |> cast(attrs, [:name, :email, :phone, :rate_count, :status, :credit_package])
    |> validate_required([:name, :email, :phone, :rate_count, :status, :credit_package],
      message: "Dieses Feld ist ein Pflichtfeld."
    )
    |> validate_email()
    |> validate_phone()
  end

  defp validate_email(changeset) do
    changeset
    |> validate_format(:email, ~r/@/, message: "Email muss ein '@' Zeichen enthalten.")
    |> unique_constraint(:email, message: "Diese Email Adresse existiert bereits.")
  end

  defp validate_phone(changeset) do
    changeset
    |> validate_format(
      :phone,
      ~r/^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/i,
      message: "Die eingegebene Telefonnummer hat ein ungültiges Format."
    )
  end
end
