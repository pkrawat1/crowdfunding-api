defmodule CrowdfundingApi.Faq do
  use CrowdfundingApi.Web, :model

  schema "faqs" do
    field :question, :string
    field :answer, :string
    belongs_to :project, CrowdfundingApi.Project

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:question, :answer])
    |> validate_required([:question, :answer])
  end
end
