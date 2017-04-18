defmodule CrowdfundingApi.Repo.Migrations.CreateProject do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :title, :string
      add :image_url, :string
      add :video_url, :string
      add :goal_amount, :integer
      add :funding_model, :string
      add :start_date, :datetime
      add :duration, :integer
      add :approved, :boolean
      add :category_id, references(:categories, on_delete: :nothing)
      add :user_id, references(:users, on_delete: :nothing)

      timestamps()
    end
    create index(:projects, [:category_id])

  end
end
