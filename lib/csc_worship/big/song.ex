defmodule CscWorship.Big.Song do
  use Ecto.Schema
  import Ecto.Changeset

  schema "songs" do
    field :name, :string
    field :type, :string
    field :artist, :string
    field :songselect, :string
    field :youtube, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(song, attrs) do
    song
    |> cast(attrs, [:name, :artist, :songselect, :youtube, :type])
    |> validate_required([:name, :artist, :youtube])
  end
end
