defmodule M307Web.LoanView do
  use M307Web, :view

  def loan_deadline(loan) do
    if Date.diff(loan.inserted_at, Date.utc_today()) > loan.rate_count * 15 and
         loan.status == :open do
      "⚡"
    else
      "🌞"
    end
  end
end
