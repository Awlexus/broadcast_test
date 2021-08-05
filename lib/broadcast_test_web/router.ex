defmodule BroadcastTestWeb.Router do
  use BroadcastTestWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BroadcastTestWeb do
    pipe_through :api
  end
end
