defmodule M307Web.LoanView do
  use M307Web, :view

  alias M307.Credit

  def deadline_status(loan) do
    if Date.diff(Date.utc_today(), loan.inserted_at) > loan.rate_count * 15 and
         loan.status == :open do
      "⚡"
    else
      "🌞"
    end
  end

  def days_until_deadline(loan) do
    IO.puts Date.diff(loan.inserted_at, Date.utc_today())
    (loan.rate_count * 15) - Date.diff(Date.utc_today(), loan.inserted_at)
  end

  def get_credit_package(loan) do
    Credit.get_package!(loan.credit_package).name
  end
end
