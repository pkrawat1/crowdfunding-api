defmodule CrowdfundingApi.ProjectView do
  use CrowdfundingApi.Web, :view

  def render("index.json", %{projects: projects}) do
    %{data: render_many(projects, CrowdfundingApi.ProjectView, "project.json")}
  end

  def render("show.json", %{project: project}) do
    render_one(project, CrowdfundingApi.ProjectView, "project.json")
  end

  def render("project.json", %{project: project}) do
    %{id: project.id,
      title: project.title,
      category_id: project.category_id,
      image_url: project.image_url,
      video_url: project.video_url,
      goal_amount: project.goal_amount,
      funding_model: project.funding_model,
      start_date: project.start_date,
      duration: project.duration}
  end

  def render("categories.json", %{categories: categories}) do
    render_many(categories, CrowdfundingApi.CategoryView, "category.json")
  end
end
