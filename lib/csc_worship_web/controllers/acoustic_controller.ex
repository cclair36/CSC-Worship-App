defmodule CscWorshipWeb.AcousticController do
  use CscWorshipWeb, :controller

  alias CscWorship.Musicians
  alias CscWorship.Musicians.Acoustic

  def index(conn, _params) do
    ac_guitar = Musicians.list_ac_guitar()
    render(conn, :index, ac_guitar: ac_guitar)
  end

  def new(conn, _params) do
    changeset = Musicians.change_acoustic(%Acoustic{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"acoustic" => acoustic_params}) do
    case Musicians.create_acoustic(acoustic_params) do
      {:ok, acoustic} ->
        conn
        |> put_flash(:info, "Acoustic created successfully.")
        |> redirect(to: ~p"/ac_guitar/#{acoustic}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    acoustic = Musicians.get_acoustic!(id)
    render(conn, :show, acoustic: acoustic)
  end

  def edit(conn, %{"id" => id}) do
    acoustic = Musicians.get_acoustic!(id)
    changeset = Musicians.change_acoustic(acoustic)
    render(conn, :edit, acoustic: acoustic, changeset: changeset)
  end

  def update(conn, %{"id" => id, "acoustic" => acoustic_params}) do
    acoustic = Musicians.get_acoustic!(id)

    case Musicians.update_acoustic(acoustic, acoustic_params) do
      {:ok, acoustic} ->
        conn
        |> put_flash(:info, "Acoustic updated successfully.")
        |> redirect(to: ~p"/ac_guitar/#{acoustic}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, acoustic: acoustic, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    acoustic = Musicians.get_acoustic!(id)
    {:ok, _acoustic} = Musicians.delete_acoustic(acoustic)

    conn
    |> put_flash(:info, "Acoustic deleted successfully.")
    |> redirect(to: ~p"/ac_guitar")
  end
end
