defmodule CrowdfundingApi.CategoryView do
  use CrowdfundingApi.Web, :view

  def render("index.json", %{categories: categories}) do
    %{data: render_many(categories, CrowdfundingApi.CategoryView, "category.json")}
  end

  def render("show.json", %{category: category}) do
    %{data: render_one(category, CrowdfundingApi.CategoryView, "category.json")}
  end

  def render("category.json", %{category: category}) do
    %{id: category.id,
      name: category.name,}
  end
end
