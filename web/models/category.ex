defmodule CrowdfundingApi.Category do
  use CrowdfundingApi.Web, :model

  schema "categories" do
    field :name, :string

    has_many :projects, CrowdfundingApi.Project

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name])
    |> validate_required([:name])
  end
end
