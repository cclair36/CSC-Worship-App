defmodule CscWorship.Musicians.Keyboard do
  use Ecto.Schema
  import Ecto.Changeset

  schema "keyboards" do
    field :name, :string
    field :dates_avaliable, {:array, :date}
    field :email, :string
    field :times_used, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(keyboard, attrs) do
    keyboard
    |> cast(attrs, [:name, :dates_avaliable, :email, :times_used])
    |> validate_required([:name, :email])
  end
end
