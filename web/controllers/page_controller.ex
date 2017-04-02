defmodule CrowdfundingApi.PageController do
  use CrowdfundingApi.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
