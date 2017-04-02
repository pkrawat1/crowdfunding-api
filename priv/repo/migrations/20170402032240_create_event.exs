defmodule CrowdfundingApi.Repo.Migrations.CreateEvent do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :title, :string
      add :country, :string
      add :date, :datetime
      add :image_url, :string
      add :description, :text
      add :project_id, references(:projects, on_delete: :nothing)

      timestamps()
    end
    create index(:events, [:project_id])

  end
end
