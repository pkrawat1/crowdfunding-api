defmodule CrowdfundingApi.UserView do
  use CrowdfundingApi.Web, :view

  def render("index.json", %{users: users}) do
    %{data: render_many(users, CrowdfundingApi.UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{data: render_one(user, CrowdfundingApi.UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{id: user.id}
  end
end
