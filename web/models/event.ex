defmodule CrowdfundingApi.Event do
  use CrowdfundingApi.Web, :model

  schema "events" do
    field :title, :string
    field :country, :string
    field :date, Ecto.DateTime
    field :image_url, :string
    field :description, :string
    belongs_to :project, CrowdfundingApi.Project

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:title, :country, :date, :image_url, :description])
    |> validate_required([:title, :country, :date, :image_url, :description])
  end
end
