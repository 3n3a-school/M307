defmodule M307Web.LoanController do
  use M307Web, :controller

  alias M307.Credit
  alias M307.Credit.Loan

  def index(conn, _params) do
    loans = Credit.list_loans()
    render(conn, "index.html", loans: loans)
  end

  def new(conn, _params) do
    changeset = Credit.change_loan(%Loan{})
    credit_packages = Credit.list_packages()
    render(conn, "new.html", changeset: changeset, credit_packages: credit_packages)
  end

  def create(conn, %{"loan" => loan_params}) do
    case Credit.create_loan(loan_params) do
      {:ok, loan} ->
        conn
        |> put_flash(:info, "Loan created successfully.")
        |> redirect(to: Routes.loan_path(conn, :show, loan))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    loan = Credit.get_loan!(id)
    credit_package = Credit.get_package!(loan.credit_package)
    render(conn, "show.html", loan: loan, credit_package: credit_package)
  end

  def edit(conn, %{"id" => id}) do
    loan = Credit.get_loan!(id)
    changeset = Credit.change_loan(loan)
    credit_packages = Credit.list_packages()
    render(conn, "edit.html", loan: loan, changeset: changeset, credit_packages: credit_packages)
  end

  def update(conn, %{"id" => id, "loan" => loan_params}) do
    loan = Credit.get_loan!(id)

    case Credit.update_loan(loan, loan_params) do
      {:ok, loan} ->
        conn
        |> put_flash(:info, "Loan updated successfully.")
        |> redirect(to: Routes.loan_path(conn, :show, loan))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", loan: loan, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    loan = Credit.get_loan!(id)
    {:ok, _loan} = Credit.delete_loan(loan)

    conn
    |> put_flash(:info, "Loan deleted successfully.")
    |> redirect(to: Routes.loan_path(conn, :index))
  end
end
