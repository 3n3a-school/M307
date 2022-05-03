defmodule M307.TodoListTest do
  use M307.DataCase

  alias M307.TodoList

  describe "todos" do
    alias M307.TodoList.Todo

    import M307.TodoListFixtures

    @invalid_attrs %{description: nil, status: nil, title: nil}

    test "list_todos/0 returns all todos" do
      todo = todo_fixture()
      assert TodoList.list_todos() == [todo]
    end

    test "get_todo!/1 returns the todo with given id" do
      todo = todo_fixture()
      assert TodoList.get_todo!(todo.id) == todo
    end

    test "create_todo/1 with valid data creates a todo" do
      valid_attrs = %{description: "some description", status: :todo, title: "some title"}

      assert {:ok, %Todo{} = todo} = TodoList.create_todo(valid_attrs)
      assert todo.description == "some description"
      assert todo.status == :todo
      assert todo.title == "some title"
    end

    test "create_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = TodoList.create_todo(@invalid_attrs)
    end

    test "update_todo/2 with valid data updates the todo" do
      todo = todo_fixture()
      update_attrs = %{description: "some updated description", status: :progress, title: "some updated title"}

      assert {:ok, %Todo{} = todo} = TodoList.update_todo(todo, update_attrs)
      assert todo.description == "some updated description"
      assert todo.status == :progress
      assert todo.title == "some updated title"
    end

    test "update_todo/2 with invalid data returns error changeset" do
      todo = todo_fixture()
      assert {:error, %Ecto.Changeset{}} = TodoList.update_todo(todo, @invalid_attrs)
      assert todo == TodoList.get_todo!(todo.id)
    end

    test "delete_todo/1 deletes the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{}} = TodoList.delete_todo(todo)
      assert_raise Ecto.NoResultsError, fn -> TodoList.get_todo!(todo.id) end
    end

    test "change_todo/1 returns a todo changeset" do
      todo = todo_fixture()
      assert %Ecto.Changeset{} = TodoList.change_todo(todo)
    end
  end
end
