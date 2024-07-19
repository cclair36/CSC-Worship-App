defmodule CscWorship.Musicians.Acoustic do
  use Ecto.Schema
  import Ecto.Changeset

  schema "ac_guitar" do
    field :name, :string
    field :dates_avaliable, {:array, :date}
    field :email, :string
    field :times_used, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(acoustic, attrs) do
    acoustic
    |> cast(attrs, [:name, :dates_avaliable, :email, :times_used])
    |> validate_required([:name, :dates_avaliable, :email])
  end
end
