defmodule M307.Credit do
  @moduledoc """
  The Credit context.
  """

  import Ecto.Query, warn: false
  alias M307.Repo

  alias M307.Credit.Loan
  alias M307.Credit.Package

  @doc """
  Returns the list of loans.

  ## Examples

      iex> list_loans()
      [%Loan{}, ...]

  """
  def list_loans do
    Repo.all(Loan)
  end

  @doc """
  Gets a single loan.

  Raises `Ecto.NoResultsError` if the Loan does not exist.

  ## Examples

      iex> get_loan!(123)
      %Loan{}

      iex> get_loan!(456)
      ** (Ecto.NoResultsError)

  """
  def get_loan!(id), do: Repo.get!(Loan, id)

  @doc """
  Creates a loan.

  ## Examples

      iex> create_loan(%{field: value})
      {:ok, %Loan{}}

      iex> create_loan(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_loan(attrs \\ %{}) do
    %Loan{}
    |> Loan.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a loan.

  ## Examples

      iex> update_loan(loan, %{field: new_value})
      {:ok, %Loan{}}

      iex> update_loan(loan, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_loan(%Loan{} = loan, attrs) do
    loan
    |> Loan.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a loan.

  ## Examples

      iex> delete_loan(loan)
      {:ok, %Loan{}}

      iex> delete_loan(loan)
      {:error, %Ecto.Changeset{}}

  """
  def delete_loan(%Loan{} = loan) do
    Repo.delete(loan)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking loan changes.

  ## Examples

      iex> change_loan(loan)
      %Ecto.Changeset{data: %Loan{}}

  """
  def change_loan(%Loan{} = loan, attrs \\ %{}) do
    Loan.changeset(loan, attrs)
  end

  @doc """
  Returns the list of credit packages.

  ## Examples

      iex> list_pacakges()
      [%Package{}, ...]

  """
  def list_packages do
    Repo.all from p in Package, select: {p.name, p.id}
  end

  @doc """
  Returns a single credit package

  ## Examples

      iex> get_package!(123)
      %Loan{}

      iex> get_package!(456)
      ** (Ecto.NoResultsError)

  """
  def get_package!(id), do: Repo.get!(Package, id)
end
