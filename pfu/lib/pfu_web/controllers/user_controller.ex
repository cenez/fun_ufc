defmodule PfuWeb.UserController do
  use PfuWeb, :controller
  alias Pfu.Repo
  alias Pfu.User

  def index(conn, _params) do
    users = Repo.tudo(User)
    render conn, "index.html", users: users
  end
  def show(conn, %{"id" => id}) do
    usuario = Pfu.Repo.pega_by_id(User, id)
    render conn, "show.html", user: usuario
  end
end
