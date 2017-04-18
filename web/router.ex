defmodule CrowdfundingApi.Router do
  use CrowdfundingApi.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug :fetch_session
  end

  pipeline :browser_auth do
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  # scope "/", CrowdfundingApi do
  #   pipe_through :browser # Use the default browser stack

  #   get "/", PageController, :index
  # end

  # Other scopes may use custom stacks.
  scope "/api/v1", CrowdfundingApi do
    pipe_through [:api, :browser_auth]

    get "/projects/draft", ProjectController, :draft
    resources "/projects", ProjectController

    get "/category", ProjectController, :category
    
    resources "/users", UserController
    delete "/logout", AuthController, :logout
    get "/credentials", AuthController, :credentials
    delete "/auth/logout", AuthController, :delete
    
    get "/validate_token", AuthController, :validate_token
  end

  scope "/api/v1/auth", CrowdfundingApi do
    pipe_through [:api, :browser_auth] # Use the default browser stack

    get "/:identity", AuthController, :login
    post "/:identity", AuthController, :login
    get "/:identity/callback", AuthController, :callback
    post "/:identity/callback", AuthController, :callback
  end

end
