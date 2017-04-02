defmodule CrowdfundingApi.Story do
  use CrowdfundingApi.Web, :model

  schema "stories" do
    field :heading, :string
    field :description, :string
    belongs_to :project, CrowdfundingApi.Project

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:heading, :description])
    |> validate_required([:heading, :description])
  end
end
