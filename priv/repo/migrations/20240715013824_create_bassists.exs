defmodule CscWorship.Repo.Migrations.CreateBassists do
  use Ecto.Migration

  def change do
    create table(:bassists) do
      add :name, :string
      add :dates_unavailable, {:array, :date}
      add :email, :string
      add :times_used, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
