defmodule CscWorship.Repo.Migrations.CreateVocalists do
  use Ecto.Migration

  def change do
    create table(:vocalists) do
      add :name, :string
      add :dates_avaliable, {:array, :date}
      add :email, :string

      timestamps(type: :utc_datetime)
    end
  end
end
