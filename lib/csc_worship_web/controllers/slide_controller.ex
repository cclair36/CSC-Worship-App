defmodule CscWorshipWeb.SlideController do
  use CscWorshipWeb, :controller

  alias CscWorship.Musicians
  alias CscWorship.Musicians.Slide

  def index(conn, _params) do
    slides = Musicians.list_slides()
    render(conn, :index, slides: slides)
  end

  def new(conn, _params) do
    changeset = Musicians.change_slide(%Slide{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"slide" => slide_params}) do
    case Musicians.create_slide(slide_params) do
      {:ok, slide} ->
        conn
        |> put_flash(:info, "Slide created successfully.")
        |> redirect(to: ~p"/slides/#{slide}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    slide = Musicians.get_slide!(id)
    render(conn, :show, slide: slide)
  end

  def edit(conn, %{"id" => id}) do
    slide = Musicians.get_slide!(id)
    changeset = Musicians.change_slide(slide)
    render(conn, :edit, slide: slide, changeset: changeset)
  end

  def update(conn, %{"id" => id, "slide" => slide_params}) do
    slide = Musicians.get_slide!(id)

    case Musicians.update_slide(slide, slide_params) do
      {:ok, slide} ->
        conn
        |> put_flash(:info, "Slide updated successfully.")
        |> redirect(to: ~p"/slides/#{slide}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, slide: slide, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    slide = Musicians.get_slide!(id)
    {:ok, _slide} = Musicians.delete_slide(slide)

    conn
    |> put_flash(:info, "Slide deleted successfully.")
    |> redirect(to: ~p"/slides")
  end
end
