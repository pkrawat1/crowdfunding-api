defmodule CrowdfundingApi.Reward do
  use CrowdfundingApi.Web, :model

  schema "rewards" do
    field :title, :string
    field :description, :string
    field :image_url, :string
    field :amount, :integer
    belongs_to :project, CrowdfundingApi.Project

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :description, :image_url, :amount])
    |> validate_required([:title, :description, :image_url, :amount])
  end
end
