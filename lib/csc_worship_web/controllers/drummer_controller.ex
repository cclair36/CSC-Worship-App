defmodule CscWorshipWeb.DrummerController do
  use CscWorshipWeb, :controller

  alias CscWorship.Musicians
  alias CscWorship.Musicians.Drummer

  def index(conn, _params) do
    drummers = Musicians.list_drummers()
    render(conn, :index, drummers: drummers)
  end

  def new(conn, _params) do
    changeset = Musicians.change_drummer(%Drummer{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"drummer" => drummer_params}) do
    case Musicians.create_drummer(drummer_params) do
      {:ok, drummer} ->
        conn
        |> put_flash(:info, "Drummer created successfully.")
        |> redirect(to: ~p"/drummers/#{drummer}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    drummer = Musicians.get_drummer!(id)
    render(conn, :show, drummer: drummer)
  end

  def edit(conn, %{"id" => id}) do
    drummer = Musicians.get_drummer!(id)
    changeset = Musicians.change_drummer(drummer)
    render(conn, :edit, drummer: drummer, changeset: changeset)
  end

  def update(conn, %{"id" => id, "drummer" => drummer_params}) do
    drummer = Musicians.get_drummer!(id)

    case Musicians.update_drummer(drummer, drummer_params) do
      {:ok, drummer} ->
        conn
        |> put_flash(:info, "Drummer updated successfully.")
        |> redirect(to: ~p"/drummers/#{drummer}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, drummer: drummer, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    drummer = Musicians.get_drummer!(id)
    {:ok, _drummer} = Musicians.delete_drummer(drummer)

    conn
    |> put_flash(:info, "Drummer deleted successfully.")
    |> redirect(to: ~p"/drummers")
  end
end
