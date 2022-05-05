defmodule M307Web.LoanControllerTest do
  use M307Web.ConnCase

  import M307.CreditFixtures

  @create_attrs %{email: "some email", name: "some name", phone: "some phone", rate_count: 42, status: :open}
  @update_attrs %{email: "some updated email", name: "some updated name", phone: "some updated phone", rate_count: 43, status: :closed}
  @invalid_attrs %{email: nil, name: nil, phone: nil, rate_count: nil, status: nil}

  describe "index" do
    test "lists all loans", %{conn: conn} do
      conn = get(conn, Routes.loan_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Loans"
    end
  end

  describe "new loan" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.loan_path(conn, :new))
      assert html_response(conn, 200) =~ "New Loan"
    end
  end

  describe "create loan" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.loan_path(conn, :create), loan: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.loan_path(conn, :show, id)

      conn = get(conn, Routes.loan_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Loan"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.loan_path(conn, :create), loan: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Loan"
    end
  end

  describe "edit loan" do
    setup [:create_loan]

    test "renders form for editing chosen loan", %{conn: conn, loan: loan} do
      conn = get(conn, Routes.loan_path(conn, :edit, loan))
      assert html_response(conn, 200) =~ "Edit Loan"
    end
  end

  describe "update loan" do
    setup [:create_loan]

    test "redirects when data is valid", %{conn: conn, loan: loan} do
      conn = put(conn, Routes.loan_path(conn, :update, loan), loan: @update_attrs)
      assert redirected_to(conn) == Routes.loan_path(conn, :show, loan)

      conn = get(conn, Routes.loan_path(conn, :show, loan))
      assert html_response(conn, 200) =~ "some updated email"
    end

    test "renders errors when data is invalid", %{conn: conn, loan: loan} do
      conn = put(conn, Routes.loan_path(conn, :update, loan), loan: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Loan"
    end
  end

  describe "delete loan" do
    setup [:create_loan]

    test "deletes chosen loan", %{conn: conn, loan: loan} do
      conn = delete(conn, Routes.loan_path(conn, :delete, loan))
      assert redirected_to(conn) == Routes.loan_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.loan_path(conn, :show, loan))
      end
    end
  end

  defp create_loan(_) do
    loan = loan_fixture()
    %{loan: loan}
  end
end
