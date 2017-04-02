defmodule CrowdfundingApi.EventTest do
  use CrowdfundingApi.ModelCase

  alias CrowdfundingApi.Event

  @valid_attrs %{country: "some content", date: %{day: 17, hour: 14, min: 0, month: 4, sec: 0, year: 2010}, description: "some content", image_url: "some content", title: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Event.changeset(%Event{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Event.changeset(%Event{}, @invalid_attrs)
    refute changeset.valid?
  end
end
