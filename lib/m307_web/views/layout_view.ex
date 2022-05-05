defmodule M307Web.LayoutView do
  use M307Web, :view

  def company_name() do
    "Kredihay"
  end

  # Phoenix LiveDashboard is available only in development by default,
  # so we instruct Elixir to not warn if the dashboard route is missing.
  @compile {:no_warn_undefined, {Routes, :live_dashboard_path, 2}}
end
