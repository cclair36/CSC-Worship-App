defmodule CscWorship.Repo.Migrations.CreateAcGuitar do
  use Ecto.Migration

  def change do
    create table(:ac_guitar) do
      add :name, :string
      add :dates_avaliable, {:array, :date}
      add :email, :string

      timestamps(type: :utc_datetime)
    end
  end
end
