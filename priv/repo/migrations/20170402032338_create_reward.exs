defmodule CrowdfundingApi.Repo.Migrations.CreateReward do
  use Ecto.Migration

  def change do
    create table(:rewards) do
      add :title, :string
      add :description, :text
      add :image_url, :string
      add :amount, :integer
      add :project_id, references(:projects, on_delete: :nothing)

      timestamps()
    end
    create index(:rewards, [:project_id])

  end
end
