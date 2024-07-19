defmodule CscWorshipWeb.SoundController do
  use CscWorshipWeb, :controller

  alias CscWorship.Musicians
  alias CscWorship.Musicians.Sound

  def index(conn, _params) do
    sounds = Musicians.list_sounds()
    render(conn, :index, sounds: sounds)
  end

  def new(conn, _params) do
    changeset = Musicians.change_sound(%Sound{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"sound" => sound_params}) do
    case Musicians.create_sound(sound_params) do
      {:ok, sound} ->
        conn
        |> put_flash(:info, "Sound created successfully.")
        |> redirect(to: ~p"/sounds/#{sound}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    sound = Musicians.get_sound!(id)
    render(conn, :show, sound: sound)
  end

  def edit(conn, %{"id" => id}) do
    sound = Musicians.get_sound!(id)
    changeset = Musicians.change_sound(sound)
    render(conn, :edit, sound: sound, changeset: changeset)
  end

  def update(conn, %{"id" => id, "sound" => sound_params}) do
    sound = Musicians.get_sound!(id)

    case Musicians.update_sound(sound, sound_params) do
      {:ok, sound} ->
        conn
        |> put_flash(:info, "Sound updated successfully.")
        |> redirect(to: ~p"/sounds/#{sound}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, sound: sound, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    sound = Musicians.get_sound!(id)
    {:ok, _sound} = Musicians.delete_sound(sound)

    conn
    |> put_flash(:info, "Sound deleted successfully.")
    |> redirect(to: ~p"/sounds")
  end
end
