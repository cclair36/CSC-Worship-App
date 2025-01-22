defmodule CscWorship.Repo.Migrations.AddUpdateForService do
  use Ecto.Migration

  def change do
    alter table("services") do
      add :updates, :boolean
    end
  end
end
