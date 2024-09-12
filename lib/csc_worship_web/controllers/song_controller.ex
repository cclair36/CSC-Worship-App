defmodule CscWorshipWeb.SongController do
  use CscWorshipWeb, :controller

  alias CscWorship.Big
  alias CscWorship.Big.Song

  def index(conn, _params) do
    songs = Big.list_songs()
    songs2 = Enum.sort_by(songs, & &1.name)
    render(conn, :index, songs: songs2)
  end

  def new(conn, _params) do
    changeset = Big.change_song(%Song{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"song" => song_params}) do
    case Big.create_song(song_params) do
      {:ok, song} ->
        conn
        |> put_flash(:info, "Song created successfully.")
        |> redirect(to: ~p"/songs/#{song}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    song = Big.get_song!(id)
    render(conn, :show, song: song)
  end

  def edit(conn, %{"id" => id}) do
    song = Big.get_song!(id)
    changeset = Big.change_song(song)
    render(conn, :edit, song: song, changeset: changeset)
  end

  def update(conn, %{"id" => id, "song" => song_params}) do
    song = Big.get_song!(id)

    case Big.update_song(song, song_params) do
      {:ok, song} ->
        conn
        |> put_flash(:info, "Song updated successfully.")
        |> redirect(to: ~p"/songs/#{song}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, song: song, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    song = Big.get_song!(id)
    {:ok, _song} = Big.delete_song(song)

    conn
    |> put_flash(:info, "Song deleted successfully.")
    |> redirect(to: ~p"/songs")
  end
end
