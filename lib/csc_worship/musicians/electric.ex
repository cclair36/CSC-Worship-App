defmodule CscWorship.Musicians.Electric do
  use Ecto.Schema
  import Ecto.Changeset

  schema "el_guitar" do
    field :name, :string
    field :dates_avaliable, {:array, :date}
    field :email, :string
    field :times_used, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(electric, attrs) do
    electric
    |> cast(attrs, [:name, :dates_avaliable, :email, :times_used])
    |> validate_required([:name, :email])
  end
end
