defmodule CrowdfundingApi.Repo.Migrations.CreateLink do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :url, :string
      add :project_id, references(:projects, on_delete: :nothing)

      timestamps()
    end
    create index(:links, [:project_id])

  end
end
