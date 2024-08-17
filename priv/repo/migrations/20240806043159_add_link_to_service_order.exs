defmodule CscWorship.Repo.Migrations.AddLinkToServiceOrder do
  use Ecto.Migration

  def change do
    alter table("services") do
      add :service_order, :string
    end
  end
end
