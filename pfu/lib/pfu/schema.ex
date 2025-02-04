defmodule Ufc.Schema do
  alias Ufc.Schema
  defmacro esquema(_any, do: bloco) do
    {_, _, s} = bloco
    quote do
      defstruct unquote(s)
    end
  end

  defmacro __using__(_opts) do
    quote do
      import Schema, only: [esquema: 2]
    end
  end

end
