defmodule CscWorship.Repo.Migrations.CreateServices do
  use Ecto.Migration

  def change do
    create table(:services) do
      add :songs, {:array, :string}
      add :notes, :string
      add :submitter, :string
      add :rehearsal_time1, :utc_datetime
      add :rehearsal_time_2, :utc_datetime
      add :date, :utc_datetime
      add :preacher, references(:speakers, on_delete: :nothing)
      add :drummer, references(:drummers, on_delete: :nothing)
      add :acoustic, references(:ac_guitar, on_delete: :nothing)
      add :electric, references(:el_guitar, on_delete: :nothing)
      add :keyboard, references(:keyboards, on_delete: :nothing)
      add :vocalist1, references(:vocalists, on_delete: :nothing)
      add :vocalist2, references(:vocalists, on_delete: :nothing)
      add :vocalist3, references(:vocalists, on_delete: :nothing)
      add :vocalist4, references(:vocalists, on_delete: :nothing)
      add :slides, references(:slides, on_delete: :nothing)
      add :sound, references(:sounds, on_delete: :nothing)

      timestamps(type: :utc_datetime)
    end

    create index(:services, [:preacher])
    create index(:services, [:drummer])
    create index(:services, [:acoustic])
    create index(:services, [:electric])
    create index(:services, [:keyboard])
    create index(:services, [:vocalist1])
    create index(:services, [:vocalist2])
    create index(:services, [:vocalist3])
    create index(:services, [:vocalist4])
    create index(:services, [:slides])
    create index(:services, [:sound])
  end
end
