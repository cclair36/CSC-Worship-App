defmodule CscWorship.Musicians.Slide do
  use Ecto.Schema
  import Ecto.Changeset

  schema "slides" do
    field :name, :string
    field :dates_avaliable, {:array, :date}
    field :email, :string
    field :times_used, :integer

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(slide, attrs) do
    slide
    |> cast(attrs, [:name, :dates_avaliable, :email, :times_used])
    |> validate_required([:name, :email])
  end
end
