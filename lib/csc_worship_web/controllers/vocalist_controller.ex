defmodule CscWorshipWeb.VocalistController do
  use CscWorshipWeb, :controller

  alias CscWorship.Musicians
  alias CscWorship.Musicians.Vocalist

  def index(conn, _params) do
    vocalists = Musicians.list_vocalists()
    render(conn, :index, vocalists: vocalists)
  end

  def new(conn, _params) do
    changeset = Musicians.change_vocalist(%Vocalist{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"vocalist" => vocalist_params}) do
    case Musicians.create_vocalist(vocalist_params) do
      {:ok, vocalist} ->
        conn
        |> put_flash(:info, "Vocalist created successfully.")
        |> redirect(to: ~p"/vocalists/#{vocalist}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    vocalist = Musicians.get_vocalist!(id)
    render(conn, :show, vocalist: vocalist)
  end

  def edit(conn, %{"id" => id}) do
    vocalist = Musicians.get_vocalist!(id)
    changeset = Musicians.change_vocalist(vocalist)
    render(conn, :edit, vocalist: vocalist, changeset: changeset)
  end

  def update(conn, %{"id" => id, "vocalist" => vocalist_params}) do
    vocalist = Musicians.get_vocalist!(id)

    case Musicians.update_vocalist(vocalist, vocalist_params) do
      {:ok, vocalist} ->
        conn
        |> put_flash(:info, "Vocalist updated successfully.")
        |> redirect(to: ~p"/vocalists/#{vocalist}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, vocalist: vocalist, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    vocalist = Musicians.get_vocalist!(id)
    {:ok, _vocalist} = Musicians.delete_vocalist(vocalist)

    conn
    |> put_flash(:info, "Vocalist deleted successfully.")
    |> redirect(to: ~p"/vocalists")
  end
end
