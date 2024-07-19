defmodule CscWorship.Repo.Migrations.CreateDrummers do
  use Ecto.Migration

  def change do
    create table(:drummers) do
      add :name, :string
      add :dates_avaliable, {:array, :date}
      add :cajon_only, :boolean, default: false, null: false

      timestamps(type: :utc_datetime)
    end
  end
end
