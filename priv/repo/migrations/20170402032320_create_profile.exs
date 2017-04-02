defmodule CrowdfundingApi.Repo.Migrations.CreateProfile do
  use Ecto.Migration

  def change do
    create table(:profiles) do
      add :document_type, :string
      add :document_url, :string
      add :full_name, :string
      add :nationality, :string
      add :birth_date, :date
      add :profile_image_url, :string
      add :bio, :string

      timestamps()
    end

  end
end
