defmodule CrowdfundingApi.FaqTest do
  use CrowdfundingApi.ModelCase

  alias CrowdfundingApi.Faq

  @valid_attrs %{answer: "some content", question: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Faq.changeset(%Faq{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Faq.changeset(%Faq{}, @invalid_attrs)
    refute changeset.valid?
  end
end
