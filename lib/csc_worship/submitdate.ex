defmodule CscWorship.Submitdate do
  use Ecto.Schema
  import Ecto.Changeset

  embedded_schema do
    field :date, :date
  end

  @doc false
  def changeset(params) do
    %CscWorship.Submitdate{}
    |> cast(params, [:date])
    |> validate_required([:date])
  end
end
