defmodule CrowdfundingApi.StoryTest do
  use CrowdfundingApi.ModelCase

  alias CrowdfundingApi.Story

  @valid_attrs %{description: "some content", heading: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Story.changeset(%Story{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Story.changeset(%Story{}, @invalid_attrs)
    refute changeset.valid?
  end
end
