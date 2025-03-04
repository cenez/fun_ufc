defmodule Pfu.Timeline.Post do
  use Ecto.Schema
  import Ecto.Changeset

  schema "posts" do
    field :body, :string
    field :likes_count, :integer, default: 0
    field :reposts_count, :integer, default: 0
    #field :user_id, :integer, default: 1
    belongs_to :user, Pfu.User
    #field :user_id, :id

    timestamps()
  end

  def admin(), do: Pfu.Repo.get(User, 1)

  @doc false
  def changeset(post, attrs) do
    post
    |> cast(attrs, [:body, :user_id])
    |> validate_required([:body, :user_id])
    |> validate_length(:body, min: 6, max: 250)
  end
end
#mix phx.gen.live Timeline Post posts username body likes_count:integer reposts_count:integer
