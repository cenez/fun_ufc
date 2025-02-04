defmodule Ufc.Usuario do
  use Ufc.Schema
  alias Ufc.Usuario

  esquema "users" do
    :nome
    :username
    :password
    :age
    :email
  end

  defp make_change(user, attrs) do
    [_ | keys] = Map.keys(%Usuario{})
    attrs = attrs |> Map.take(keys)
    user |> Map.merge(attrs, fn _k, _v1, v2 -> v2 end)
  end

  def changeset(user, attrs, hash: false), do: make_change(user, attrs)

  def changeset(user, attrs, hash: true) do
    user = make_change(user, attrs)
    put_password_hash(user)
  end
  defp put_password_hash(user) do
    Map.replace(user, :password, Comeonin.Bcrypt.hashpwsalt(user.password))
  end
end
