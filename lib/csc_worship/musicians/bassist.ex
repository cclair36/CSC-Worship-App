defmodule CscWorship.Musicians.Bassist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "bassists" do
    field :name, :string
    field :dates_unavailable, {:array, :date}
    field :email, :string
    field :times_used, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(bassist, attrs) do
    bassist
    |> cast(attrs, [:name, :dates_unavailable, :email, :times_used])
    |> validate_required([:name, :email])
  end
end
