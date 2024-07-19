defmodule CscWorshipWeb.KeyboardController do
  use CscWorshipWeb, :controller

  alias CscWorship.Musicians
  alias CscWorship.Musicians.Keyboard

  def index(conn, _params) do
    keyboards = Musicians.list_keyboards()
    render(conn, :index, keyboards: keyboards)
  end

  def new(conn, _params) do
    changeset = Musicians.change_keyboard(%Keyboard{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"keyboard" => keyboard_params}) do
    case Musicians.create_keyboard(keyboard_params) do
      {:ok, keyboard} ->
        conn
        |> put_flash(:info, "Keyboard created successfully.")
        |> redirect(to: ~p"/keyboards/#{keyboard}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    keyboard = Musicians.get_keyboard!(id)
    render(conn, :show, keyboard: keyboard)
  end

  def edit(conn, %{"id" => id}) do
    keyboard = Musicians.get_keyboard!(id)
    changeset = Musicians.change_keyboard(keyboard)
    render(conn, :edit, keyboard: keyboard, changeset: changeset)
  end

  def update(conn, %{"id" => id, "keyboard" => keyboard_params}) do
    keyboard = Musicians.get_keyboard!(id)

    case Musicians.update_keyboard(keyboard, keyboard_params) do
      {:ok, keyboard} ->
        conn
        |> put_flash(:info, "Keyboard updated successfully.")
        |> redirect(to: ~p"/keyboards/#{keyboard}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, keyboard: keyboard, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    keyboard = Musicians.get_keyboard!(id)
    {:ok, _keyboard} = Musicians.delete_keyboard(keyboard)

    conn
    |> put_flash(:info, "Keyboard deleted successfully.")
    |> redirect(to: ~p"/keyboards")
  end
end
