defmodule CscWorship.Repo.Migrations.AddStuff do
  use Ecto.Migration

  def change do
    alter table("drummers") do
      add :email, :string
      add :times_used, :integer
    end
    alter table("keyboards") do
      add :times_used, :integer
    end
    alter table("ac_guitar") do
      add :times_used, :integer
    end
    alter table("el_guitar") do
      add :times_used, :integer
    end
    alter table("slides") do
      add :times_used, :integer
    end
    alter table("sounds") do
      add :times_used, :integer
    end
    alter table("vocalists") do
      add :times_used, :integer
    end
    alter table("speakers") do
      add :times_used, :integer
    end
  end
end
