defmodule CrowdfundingApi.ProjectController do
  use CrowdfundingApi.Web, :controller

  alias CrowdfundingApi.Project
  alias CrowdfundingApi.Category

  def index(conn, _params) do
    projects = Repo.all(Project)
    render(conn, "index.json", projects: projects)
  end

  def create(conn, project_params) do
    changeset = Project.changeset(%Project{}, project_params)

    case Repo.insert(changeset) do
      {:ok, project} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", project_path(conn, :show, project))
        |> render("show.json", project: project)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(CrowdfundingApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    project = Repo.get!(Project, id)
    render(conn, "show.json", project: project)
  end

  def draft(conn, _params) do
    project = Repo.get_by(Project, approved: false) ||
              %{id: nil, title: nil, category_id: nil, image_url: nil,
                video_url: nil, goal_amount: nil, funding_model: nil,
                start_date: nil, duration: nil
              }
    render(conn, "show.json", project: project)
  end

  def update(conn, %{"id" => id, "project" => project_params}) do
    project = Repo.get!(Project, id)
    changeset = Project.changeset(project, project_params)

    case Repo.update(changeset) do
      {:ok, project} ->
        render(conn, "show.json", project: project)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(CrowdfundingApi.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    project = Repo.get!(Project, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(project)

    send_resp(conn, :no_content, "")
  end

  def category(conn, _params) do
    categories = Repo.all(Category)
    render(conn, "categories.json", categories: categories)
  end
end
