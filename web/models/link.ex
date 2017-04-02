defmodule CrowdfundingApi.Link do
  use CrowdfundingApi.Web, :model

  schema "links" do
    field :url, :string
    belongs_to :project, CrowdfundingApi.Project

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:url])
    |> validate_required([:url])
  end
end
