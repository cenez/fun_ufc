defmodule PfuWeb.UserController do
  use PfuWeb, :controller
  alias Pfu.Repo
  alias Pfu.User

  def index(conn, _params) do
    users = Repo.all(User)
    render conn, "index.html", users: users
  end
  def show(conn, %{"id" => id}) do
    usuario = Repo.get(User, id)
    render conn, "show.html", user: usuario
  end
  def new(conn, _params) do
    changeset = User.changeset(%User{}, %{})
    render(conn, "new.html", changeset: changeset)
  end
  def create(conn, %{"user" => user_params}) do
    changeset = User.changeset(%User{}, user_params)
    #nao trata erro:
    #{:ok, user} = Repo.insert(changeset)
    #conn
    #  |> put_flash(:info, "#{user.name} created!")
    #  |> redirect(to: Helpers.user_path(conn, :index))
    case Repo.insert(changeset) do
      {:ok, user} ->
        conn
          #|> Pfu.Auth.login(user)
          |> put_flash(:info, "#{user.name} created!")
          |> redirect(to: Routes.user_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end
end
