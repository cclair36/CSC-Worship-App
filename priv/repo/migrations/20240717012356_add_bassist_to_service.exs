defmodule CscWorship.Repo.Migrations.AddBassistToService do
  use Ecto.Migration

  def change do
alter table("services") do
  add :bassist_id, references(:bassists, on_delete: :nothing)
  end
end
end
