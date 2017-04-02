defmodule CrowdfundingApi.Profile do
  use CrowdfundingApi.Web, :model

  schema "profiles" do
    field :document_type, :string
    field :document_url, :string
    field :full_name, :string
    field :nationality, :string
    field :birth_date, Ecto.Date
    field :profile_image_url, :string
    field :bio, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:document_type, :document_url, :full_name, :nationality, :birth_date, :profile_image_url, :bio])
    |> validate_required([:document_type, :document_url, :full_name, :nationality, :birth_date, :profile_image_url, :bio])
  end
end
