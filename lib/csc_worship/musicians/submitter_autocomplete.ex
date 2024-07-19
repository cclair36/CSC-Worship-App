defmodule CscWorship.Musicians.SubmitterAutocomplete do
  use Ecto.Schema
  import Ecto.Changeset

  schema "submitter_autocomplete" do
    field :name, :string

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(submitter_autocomplete, attrs) do
    submitter_autocomplete
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
