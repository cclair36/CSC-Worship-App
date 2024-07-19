defmodule CscWorship.Musicians.Speaker do
  use Ecto.Schema
  import Ecto.Changeset

  schema "speakers" do
    field :name, :string
    field :dates_preaching, {:array, :date}
    field :email, :string
    field :times_used, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(speaker, attrs) do
    speaker
    |> cast(attrs, [:name, :dates_preaching, :email, :times_used])
    |> validate_required([:name, :email])
  end
end
