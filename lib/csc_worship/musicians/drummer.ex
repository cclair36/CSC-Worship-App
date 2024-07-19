defmodule CscWorship.Musicians.Drummer do
  use Ecto.Schema
  import Ecto.Changeset

  schema "drummers" do
    field :name, :string
    field :dates_avaliable, {:array, :date}
    field :cajon_only, :boolean, default: false
    field :email, :string
    field :times_used, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(drummer, attrs) do
    drummer
    |> cast(attrs, [:name, :dates_avaliable, :cajon_only, :times_used, :email])
    |> validate_required([:name, :email, :cajon_only])
  end
end
