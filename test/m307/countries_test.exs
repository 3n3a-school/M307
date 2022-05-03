defmodule M307.CountriesTest do
  use M307.DataCase

  alias M307.Countries

  describe "cities" do
    alias M307.Countries.City

    import M307.CountriesFixtures

    @invalid_attrs %{name: nil}

    test "list_cities/0 returns all cities" do
      city = city_fixture()
      assert Countries.list_cities() == [city]
    end

    test "get_city!/1 returns the city with given id" do
      city = city_fixture()
      assert Countries.get_city!(city.id) == city
    end

    test "create_city/1 with valid data creates a city" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %City{} = city} = Countries.create_city(valid_attrs)
      assert city.name == "some name"
    end

    test "create_city/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Countries.create_city(@invalid_attrs)
    end

    test "update_city/2 with valid data updates the city" do
      city = city_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %City{} = city} = Countries.update_city(city, update_attrs)
      assert city.name == "some updated name"
    end

    test "update_city/2 with invalid data returns error changeset" do
      city = city_fixture()
      assert {:error, %Ecto.Changeset{}} = Countries.update_city(city, @invalid_attrs)
      assert city == Countries.get_city!(city.id)
    end

    test "delete_city/1 deletes the city" do
      city = city_fixture()
      assert {:ok, %City{}} = Countries.delete_city(city)
      assert_raise Ecto.NoResultsError, fn -> Countries.get_city!(city.id) end
    end

    test "change_city/1 returns a city changeset" do
      city = city_fixture()
      assert %Ecto.Changeset{} = Countries.change_city(city)
    end
  end
end
