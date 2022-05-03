defmodule M307Web.PageController do
  use M307Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
