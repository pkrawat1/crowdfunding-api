defmodule CrowdfundingApi.Repo.Migrations.CreateStory do
  use Ecto.Migration

  def change do
    create table(:stories) do
      add :heading, :string
      add :description, :text
      add :project_id, references(:projects, on_delete: :nothing)

      timestamps()
    end
    create index(:stories, [:project_id])

  end
end
