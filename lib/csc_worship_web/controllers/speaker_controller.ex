defmodule CscWorshipWeb.SpeakerController do
  use CscWorshipWeb, :controller

  alias CscWorship.Musicians
  alias CscWorship.Musicians.Speaker

  def index(conn, _params) do
    speakers = Musicians.list_speakers()
    render(conn, :index, speakers: speakers)
  end

  def new(conn, _params) do
    changeset = Musicians.change_speaker(%Speaker{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"speaker" => speaker_params}) do
    case Musicians.create_speaker(speaker_params) do
      {:ok, speaker} ->
        conn
        |> put_flash(:info, "Speaker created successfully.")
        |> redirect(to: ~p"/speakers/#{speaker}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    speaker = Musicians.get_speaker!(id)
    render(conn, :show, speaker: speaker)
  end

  def edit(conn, %{"id" => id}) do
    speaker = Musicians.get_speaker!(id)
    changeset = Musicians.change_speaker(speaker)
    render(conn, :edit, speaker: speaker, changeset: changeset)
  end

  def update(conn, %{"id" => id, "speaker" => speaker_params}) do
    speaker = Musicians.get_speaker!(id)

    case Musicians.update_speaker(speaker, speaker_params) do
      {:ok, speaker} ->
        conn
        |> put_flash(:info, "Speaker updated successfully.")
        |> redirect(to: ~p"/speakers/#{speaker}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, speaker: speaker, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    speaker = Musicians.get_speaker!(id)
    {:ok, _speaker} = Musicians.delete_speaker(speaker)

    conn
    |> put_flash(:info, "Speaker deleted successfully.")
    |> redirect(to: ~p"/speakers")
  end
end
