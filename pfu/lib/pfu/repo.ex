defmodule Pfu.Repo do
  use Ecto.Repo,
    otp_app: :pfu,
    adapter: Ecto.Adapters.Postgres
    alias Pfu.Pessoa

    #Exemplos #################
    def todos(Pessoa) do
      [%Pessoa{id: 1, name: "Joao", password: "753", username: "joaozim"},
      %Pessoa{id: 2, name: "Maria", password: "159", username: "mariazinha"},
      %Pessoa{id: 3, name: "Ana", password: "321", username: "aninha"}]
    end
    def pega(module, id) do
      pessoas = todos(module)
      Enum.find pessoas, fn p -> p.id == id end
    end
    ###########################

end
