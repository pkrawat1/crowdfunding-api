defmodule CrowdfundingApi.Router do
  use CrowdfundingApi.Web, :router
  use Coherence.Router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug Coherence.Authentication.Session, protected: true
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :protect_from_forgery
    plug Coherence.Authentication.Session, protected: true
  end

  # scope "/", CrowdfundingApi do
  #   pipe_through :browser # Use the default browser stack

  #   get "/", PageController, :index
  # end

  # Other scopes may use custom stacks.
  scope "/api/v1", CrowdfundingApi do
    pipe_through :api

    coherence_routes()

    resources "/projects", ProjectController
    get "/category", ProjectController, :category
    get "/projects/draft/:id", ProjectController, :draft
    resources "/users", UserController
  end

  scope "/auth", CrowdfundingApi do
    pipe_through :browser

    get "/:provider", AuthController, :request
    get "/:provider/callback", AuthController, :callback
  end

  scope "/api/v1", CrowdfundingApi do
    pipe_through :protected
    coherence_routes :protected
  end
end
