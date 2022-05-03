defmodule M307.TodoListFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `M307.TodoList` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        description: "some description",
        status: :todo,
        title: "some title"
      })
      |> M307.TodoList.create_todo()

    todo
  end
end
