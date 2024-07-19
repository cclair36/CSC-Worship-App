defmodule CscWorship.Repo.Migrations.CreateSongs do
  use Ecto.Migration

  def change do
    create table(:songs) do
      add :name, :string
      add :artist, :string
      add :songselect, :string
      add :youtube, :string
      add :type, :string

      timestamps(type: :utc_datetime)
    end
  end
end
