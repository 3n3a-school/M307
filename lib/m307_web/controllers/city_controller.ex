defmodule M307Web.CityController do
  use M307Web, :controller

  alias M307.Countries
  alias M307.Countries.City

  action_fallback M307Web.FallbackController

  def index(conn, _params) do
    cities = Countries.list_cities()
    render(conn, "index.json", cities: cities)
  end

  def create(conn, %{"city" => city_params}) do
    with {:ok, %City{} = city} <- Countries.create_city(city_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.city_path(conn, :show, city))
      |> render("show.json", city: city)
    end
  end

  def show(conn, %{"id" => id}) do
    city = Countries.get_city!(id)
    render(conn, "show.json", city: city)
  end

  def update(conn, %{"id" => id, "city" => city_params}) do
    city = Countries.get_city!(id)

    with {:ok, %City{} = city} <- Countries.update_city(city, city_params) do
      render(conn, "show.json", city: city)
    end
  end

  def delete(conn, %{"id" => id}) do
    city = Countries.get_city!(id)

    with {:ok, %City{}} <- Countries.delete_city(city) do
      send_resp(conn, :no_content, "")
    end
  end
end
