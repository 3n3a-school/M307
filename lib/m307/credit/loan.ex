defmodule M307.Credit.Loan do
  use Ecto.Schema
  import Ecto.Changeset

  schema "loans" do
    field :email, :string
    field :name, :string
    field :phone, :string
    field :rate_count, :integer
    field :status, Ecto.Enum, values: [:open, :closed], default: :open
    field :credit_package, :id

    timestamps()
  end

  @doc false
  def changeset(loan, attrs) do
    loan
    |> cast(attrs, [:name, :email, :phone, :rate_count, :status, :credit_package])
    |> validate_required([:name, :email, :rate_count, :status, :credit_package],
      message: "This field is required, please fill it out."
    )
    |> validate_email()
    |> validate_phone()
    |> validate_rate_count()
  end

  defp validate_email(changeset) do
    changeset
    |> validate_format(:email, ~r/@/, message: "Email must include an '@' sign.")
    |> unique_constraint(:email, message: "This email address already exists.")
  end

  defp validate_phone(changeset) do
    changeset
    |> validate_format(
      :phone,
      ~r/^[\+]?[(]?[0-9]{3}[)]?[-\s\.]?[0-9]{3}[-\s\.]?[0-9]{4,6}$/i,
      message: "The entered phonenumber exists in a wrong format."
    )
  end

  def validate_rate_count(changeset) do
    changeset
    |> validate_number(:rate_count,
      greater_than_or_equal_to: 1,
      less_than_or_equal_to: 10,
      message: "The number of rates has to be between 1 and 10."
    )
  end
end
