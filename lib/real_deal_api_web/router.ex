defmodule RealDealApiWeb.Router do
  use RealDealApiWeb, :router
  use Plug.ErrorHandler

  defp handle_errors(conn, %{reason: %Phoenix.Router.NoRouteError{message: message}}) do
    conn
    |> json(%{error: message})
    # stop any downstream plugs from being executed after the errors called.
    |> halt()
  end

  defp handle_errors(conn, %{reason: %{message: message}}) do
    conn |> json(%{error: message}) |> halt()
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", RealDealApiWeb do
    pipe_through :api
    get "/", DefaultController, :index
    post "/accounts/create", AccountController, :create
    post "/accounts/sign_in", AccountController, :sign_in
  end
end
