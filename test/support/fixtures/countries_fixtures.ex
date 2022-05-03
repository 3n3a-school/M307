defmodule M307.CountriesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `M307.Countries` context.
  """

  @doc """
  Generate a city.
  """
  def city_fixture(attrs \\ %{}) do
    {:ok, city} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> M307.Countries.create_city()

    city
  end
end
