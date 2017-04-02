defmodule CrowdfundingApi.ProfileTest do
  use CrowdfundingApi.ModelCase

  alias CrowdfundingApi.Profile

  @valid_attrs %{bio: "some content", birth_date: %{day: 17, month: 4, year: 2010}, document_type: "some content", document_url: "some content", full_name: "some content", nationality: "some content", profile_image_url: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Profile.changeset(%Profile{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Profile.changeset(%Profile{}, @invalid_attrs)
    refute changeset.valid?
  end
end
