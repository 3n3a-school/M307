defmodule M307Web.PageController do
  use M307Web, :controller

  def index(conn, _params) do
    conn
    |> redirect(to: Routes.loan_path(conn, :index))
    # render(conn, "index.html")
  end
end
