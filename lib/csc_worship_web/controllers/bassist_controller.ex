defmodule CscWorshipWeb.BassistController do
  use CscWorshipWeb, :controller

  alias CscWorship.Musicians
  alias CscWorship.Musicians.Bassist

  def index(conn, _params) do
    bassists = Musicians.list_bassists()
    render(conn, :index, bassists: bassists)
  end

  def new(conn, _params) do
    changeset = Musicians.change_bassist(%Bassist{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"bassist" => bassist_params}) do
    case Musicians.create_bassist(bassist_params) do
      {:ok, bassist} ->
        conn
        |> put_flash(:info, "Bassist created successfully.")
        |> redirect(to: ~p"/bassists/#{bassist}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    bassist = Musicians.get_bassist!(id)
    render(conn, :show, bassist: bassist)
  end

  def edit(conn, %{"id" => id}) do
    bassist = Musicians.get_bassist!(id)
    changeset = Musicians.change_bassist(bassist)
    render(conn, :edit, bassist: bassist, changeset: changeset)
  end

  def update(conn, %{"id" => id, "bassist" => bassist_params}) do
    bassist = Musicians.get_bassist!(id)

    case Musicians.update_bassist(bassist, bassist_params) do
      {:ok, bassist} ->
        conn
        |> put_flash(:info, "Bassist updated successfully.")
        |> redirect(to: ~p"/bassists/#{bassist}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, bassist: bassist, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    bassist = Musicians.get_bassist!(id)
    {:ok, _bassist} = Musicians.delete_bassist(bassist)

    conn
    |> put_flash(:info, "Bassist deleted successfully.")
    |> redirect(to: ~p"/bassists")
  end
end
