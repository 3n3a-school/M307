defmodule M307.CreditFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `M307.Credit` context.
  """

  @doc """
  Generate a loan.
  """
  def loan_fixture(attrs \\ %{}) do
    {:ok, loan} =
      attrs
      |> Enum.into(%{
        email: "some email",
        name: "some name",
        phone: "some phone",
        rate_count: 42,
        status: :open
      })
      |> M307.Credit.create_loan()

    loan
  end
end
