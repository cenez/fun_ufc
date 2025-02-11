defmodule Pfu.User do #mix phx.gen.schema User users name:string username:string password_hash:string
  use Ecto.Schema
  import Ecto.Changeset

  schema "users" do
    field :name, :string
    field :username, :string
    field :password, :string, virtual: true
    field :password_hash, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :username, :password, :password_hash])
    |> validate_required([:name, :username, :password])
  end
end
