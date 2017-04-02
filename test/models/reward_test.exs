defmodule CrowdfundingApi.RewardTest do
  use CrowdfundingApi.ModelCase

  alias CrowdfundingApi.Reward

  @valid_attrs %{amount: 42, description: "some content", image_url: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Reward.changeset(%Reward{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Reward.changeset(%Reward{}, @invalid_attrs)
    refute changeset.valid?
  end
end
