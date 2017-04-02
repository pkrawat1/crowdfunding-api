defmodule CrowdfundingApi.ProjectTest do
  use CrowdfundingApi.ModelCase

  alias CrowdfundingApi.Project

  @valid_attrs %{duration: 42, funding_model: "some content", goal_amount: 42, image_url: "some content", start_date: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, title: "some content", video_url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Project.changeset(%Project{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Project.changeset(%Project{}, @invalid_attrs)
    refute changeset.valid?
  end
end
