defmodule CscWorship.Repo.Migrations.AddBass do
  use Ecto.Migration

  def change do
    create table(:bassists) do
      add :name, :string
      add :dates_avaliable, {:array, :date}
      add :email, :string
      add :times_used, :integer
    end
  end
end
