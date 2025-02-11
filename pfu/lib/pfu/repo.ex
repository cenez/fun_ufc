defmodule Pfu.Repo do
  use Ecto.Repo,
    otp_app: :pfu,
    adapter: Ecto.Adapters.Postgres
    alias Pfu.User
    alias Pfu.Pessoa


    def tudo(Pessoa) do
      [%Pessoa{id: "1", name: "Joao", username: "joaozim", password: "753"},
      %Pessoa{id: "2", name: "Maria", username: "mariazinha", password: "159"},
      %Pessoa{id: "3", name: "Ana", username: "aninha", password: "321"}]
    end

    def tudo(User) do
      Pfu.Repo.all(User)
    end

    def tudo(_module), do: []

    def pega_by_id(module, id) do
      Enum.find tudo(module), fn p -> p.id == id end
    end

end
