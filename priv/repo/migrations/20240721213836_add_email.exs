defmodule CscWorship.Repo.Migrations.AddEmail do
  use Ecto.Migration

  def change do
    alter table("services") do
      add :email_sent, :boolean
      add :updated, :boolean
    end
  end
end
