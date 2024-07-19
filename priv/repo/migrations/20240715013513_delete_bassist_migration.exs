defmodule CscWorship.Repo.Migrations.DeleteBassistMigration do
  use Ecto.Migration

  def change do
    drop table(:bassists)
  end
end
