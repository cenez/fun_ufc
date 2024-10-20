defmodule FunUfc.Repo do
  use Ecto.Repo,
    otp_app: :fun_ufc,
    adapter: Ecto.Adapters.Postgres
end
