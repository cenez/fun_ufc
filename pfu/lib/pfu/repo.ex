defmodule Pfu.Repo do
  use Ecto.Repo,
    otp_app: :pfu,
    adapter: Ecto.Adapters.Postgres
    alias Pfu.User

    def todos(User) do
      [%User{id: 1, name: "Joao", password: "753", username: "joaozim"},
        %User{id: 2, name: "Maria", password: "159", username: "mariazinha"},
        %User{id: 3, name: "Ana", password: "321", username: "aninha"}]
    end
    def pega(module, id) do
      users = todos(module)
      Enum.find users, fn u -> u.id == id end
    end
end
