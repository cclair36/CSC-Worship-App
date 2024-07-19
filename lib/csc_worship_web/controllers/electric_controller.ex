defmodule CscWorshipWeb.ElectricController do
  use CscWorshipWeb, :controller

  alias CscWorship.Musicians
  alias CscWorship.Musicians.Electric

  def index(conn, _params) do
    el_guitar = Musicians.list_el_guitar()
    render(conn, :index, el_guitar: el_guitar)
  end

  def new(conn, _params) do
    changeset = Musicians.change_electric(%Electric{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"electric" => electric_params}) do
    case Musicians.create_electric(electric_params) do
      {:ok, electric} ->
        conn
        |> put_flash(:info, "Electric created successfully.")
        |> redirect(to: ~p"/el_guitar/#{electric}")
        
      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    electric = Musicians.get_electric!(id)
    render(conn, :show, electric: electric)
  end

  def edit(conn, %{"id" => id}) do
    electric = Musicians.get_electric!(id)
    changeset = Musicians.change_electric(electric)
    render(conn, :edit, electric: electric, changeset: changeset)
  end

  def update(conn, %{"id" => id, "electric" => electric_params}) do
    electric = Musicians.get_electric!(id)

    case Musicians.update_electric(electric, electric_params) do
      {:ok, electric} ->
        conn
        |> put_flash(:info, "Electric updated successfully.")
        |> redirect(to: ~p"/el_guitar/#{electric}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, electric: electric, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    electric = Musicians.get_electric!(id)
    {:ok, _electric} = Musicians.delete_electric(electric)

    conn
    |> put_flash(:info, "Electric deleted successfully.")
    |> redirect(to: ~p"/el_guitar")
  end
end
