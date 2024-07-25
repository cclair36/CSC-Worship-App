defmodule CscWorship.Repo.Migrations.AddSound2 do
  use Ecto.Migration

  def change do
      alter table("services") do
        add :sound2, references(:sounds, on_delete: :nothing)
      end
  end
end
