defmodule CrowdfundingApi.Repo.Migrations.CreateFaq do
  use Ecto.Migration

  def change do
    create table(:faqs) do
      add :question, :text
      add :answer, :text
      add :project_id, references(:projects, on_delete: :nothing)

      timestamps()
    end
    create index(:faqs, [:project_id])

  end
end
