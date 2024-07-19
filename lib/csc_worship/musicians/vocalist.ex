defmodule CscWorship.Musicians.Vocalist do
  use Ecto.Schema
  import Ecto.Changeset

  schema "vocalists" do
    field :name, :string
    field :dates_avaliable, {:array, :date}
    field :email, :string
    field :times_used, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(vocalist, attrs) do
    vocalist
    |> cast(attrs, [:name, :dates_avaliable, :email, :times_used])
    |> validate_required([:name, :email])
  end
end
