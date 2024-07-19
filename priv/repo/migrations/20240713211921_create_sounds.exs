defmodule CscWorship.Repo.Migrations.CreateSounds do
  use Ecto.Migration

  def change do
    create table(:sounds) do
      add :name, :string
      add :dates_avaliable, {:array, :date}
      add :email, :string

      timestamps(type: :utc_datetime)
    end
  end
end
