defmodule M307.TodoList.Todo do
  use Ecto.Schema
  import Ecto.Changeset

  schema "todos" do
    field :description, :string
    field :status, Ecto.Enum, values: [:todo, :progress, :done]
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(todo, attrs) do
    todo
    |> cast(attrs, [:title, :description, :status])
    |> validate_required([:title, :description, :status])
  end
end
