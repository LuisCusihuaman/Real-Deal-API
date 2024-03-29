defmodule RealDealApiWeb.Auth.ErrorResponse.Unauthorized do
  defexception message: "Unauthorized", plug_status: 401
end

defmodule RealDealApiWeb.Auth.ErrorResponse.Forbidden do
  defexception message: "You don't have permission to access this resource", plug_status: 403
end

defmodule RealDealApiWeb.Auth.ErrorResponse.NotFound do
  defexception message: "Not Found", plug_status: 404
end
