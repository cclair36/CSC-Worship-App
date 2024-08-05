defmodule CscWorshipWeb.PageController do
  use CscWorshipWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home)
  end

 def create(conn, %{"submitdate" => date}) do
  redirect(conn, to: Routes.service_path(conn, :new, date: date))
end
end
