defmodule M307.CreditTest do
  use M307.DataCase

  alias M307.Credit

  describe "loans" do
    alias M307.Credit.Loan

    import M307.CreditFixtures

    @invalid_attrs %{email: nil, name: nil, phone: nil, rate_count: nil, status: nil}

    test "list_loans/0 returns all loans" do
      loan = loan_fixture()
      assert Credit.list_loans() == [loan]
    end

    test "get_loan!/1 returns the loan with given id" do
      loan = loan_fixture()
      assert Credit.get_loan!(loan.id) == loan
    end

    test "create_loan/1 with valid data creates a loan" do
      valid_attrs = %{email: "some email", name: "some name", phone: "some phone", rate_count: 42, status: :open}

      assert {:ok, %Loan{} = loan} = Credit.create_loan(valid_attrs)
      assert loan.email == "some email"
      assert loan.name == "some name"
      assert loan.phone == "some phone"
      assert loan.rate_count == 42
      assert loan.status == :open
    end

    test "create_loan/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Credit.create_loan(@invalid_attrs)
    end

    test "update_loan/2 with valid data updates the loan" do
      loan = loan_fixture()
      update_attrs = %{email: "some updated email", name: "some updated name", phone: "some updated phone", rate_count: 43, status: :closed}

      assert {:ok, %Loan{} = loan} = Credit.update_loan(loan, update_attrs)
      assert loan.email == "some updated email"
      assert loan.name == "some updated name"
      assert loan.phone == "some updated phone"
      assert loan.rate_count == 43
      assert loan.status == :closed
    end

    test "update_loan/2 with invalid data returns error changeset" do
      loan = loan_fixture()
      assert {:error, %Ecto.Changeset{}} = Credit.update_loan(loan, @invalid_attrs)
      assert loan == Credit.get_loan!(loan.id)
    end

    test "delete_loan/1 deletes the loan" do
      loan = loan_fixture()
      assert {:ok, %Loan{}} = Credit.delete_loan(loan)
      assert_raise Ecto.NoResultsError, fn -> Credit.get_loan!(loan.id) end
    end

    test "change_loan/1 returns a loan changeset" do
      loan = loan_fixture()
      assert %Ecto.Changeset{} = Credit.change_loan(loan)
    end
  end
end
