defmodule CscWorship.Repo.Migrations.CreateSpeakers do
  use Ecto.Migration

  def change do
    create table(:speakers) do
      add :name, :string
      add :dates_preaching, {:array, :date}
      add :email, :string

      timestamps(type: :utc_datetime)
    end
  end
end
