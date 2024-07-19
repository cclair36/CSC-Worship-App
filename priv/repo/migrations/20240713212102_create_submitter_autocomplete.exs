defmodule CscWorship.Repo.Migrations.CreateSubmitterAutocomplete do
  use Ecto.Migration

  def change do
    create table(:submitter_autocomplete) do
      add :name, :string

      timestamps(type: :utc_datetime)
    end
  end
end
