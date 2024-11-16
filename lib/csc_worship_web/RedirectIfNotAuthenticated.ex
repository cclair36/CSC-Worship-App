defmodule CscWorship.Plugs.RedirectIfNotAuthenticated do
  import Plug.Conn
  import Phoenix.Controller
  import CscWorshipWeb.Router
  def init(_opts), do: []

  def call(conn, _opts) do
    if conn.assigns[:current_user] do
      conn
    else
      conn
      |> redirect(to: Routes.user_session_path(conn, :new)) # "users/log_in"
      |> halt()
    end
  end
end
