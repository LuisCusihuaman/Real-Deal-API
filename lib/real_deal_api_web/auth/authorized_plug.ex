defmodule RealDealApiWeb.Auth.AuthorizedPlug do
  alias RealDealApiWeb.Auth.ErrorResponse

  def is_authorized(%{params: %{"account" => params}} = conn, _opts) do
    if conn.assigns.account.id == params["id"] do
      # session account id maches account id that is being requested
      conn
    else
      raise ErrorResponse.Forbidden
    end
  end

  def is_authorized(%{params: %{"user" => params}} = conn, _opts) do
    if conn.assigns.account.user.id == params["id"] do
      # session user id maches account id that is being requested
      conn
    else
      raise ErrorResponse.Forbidden
    end
  end
end
