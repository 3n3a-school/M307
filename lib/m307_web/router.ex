defmodule M307Web.Router do
  use M307Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {M307Web.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", M307Web do
    pipe_through :browser

    get "/", PageController, :index
    resources "/loans", LoanController
  end

  # Other scopes may use custom stacks.
  # scope "/api", M307Web do
  #   pipe_through :api
  # end
end
