defmodule CscWorshipWeb.SubmitterAutocompleteController do
  use CscWorshipWeb, :controller

  alias CscWorship.Musicians
  alias CscWorship.Musicians.SubmitterAutocomplete

  def index(conn, _params) do
    submitter_autocomplete = Musicians.list_submitter_autocomplete()
    render(conn, :index, submitter_autocomplete_collection: submitter_autocomplete)
  end

  def new(conn, _params) do
    changeset = Musicians.change_submitter_autocomplete(%SubmitterAutocomplete{})
    render(conn, :new, changeset: changeset)
  end

  def create(conn, %{"submitter_autocomplete" => submitter_autocomplete_params}) do
    case Musicians.create_submitter_autocomplete(submitter_autocomplete_params) do
      {:ok, submitter_autocomplete} ->
        conn
        |> put_flash(:info, "Submitter autocomplete created successfully.")
        |> redirect(to: ~p"/submitter_autocomplete/#{submitter_autocomplete}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :new, changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    submitter_autocomplete = Musicians.get_submitter_autocomplete!(id)
    render(conn, :show, submitter_autocomplete: submitter_autocomplete)
  end

  def edit(conn, %{"id" => id}) do
    submitter_autocomplete = Musicians.get_submitter_autocomplete!(id)
    changeset = Musicians.change_submitter_autocomplete(submitter_autocomplete)
    render(conn, :edit, submitter_autocomplete: submitter_autocomplete, changeset: changeset)
  end

  def update(conn, %{"id" => id, "submitter_autocomplete" => submitter_autocomplete_params}) do
    submitter_autocomplete = Musicians.get_submitter_autocomplete!(id)

    case Musicians.update_submitter_autocomplete(submitter_autocomplete, submitter_autocomplete_params) do
      {:ok, submitter_autocomplete} ->
        conn
        |> put_flash(:info, "Submitter autocomplete updated successfully.")
        |> redirect(to: ~p"/submitter_autocomplete/#{submitter_autocomplete}")

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, :edit, submitter_autocomplete: submitter_autocomplete, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    submitter_autocomplete = Musicians.get_submitter_autocomplete!(id)
    {:ok, _submitter_autocomplete} = Musicians.delete_submitter_autocomplete(submitter_autocomplete)

    conn
    |> put_flash(:info, "Submitter autocomplete deleted successfully.")
    |> redirect(to: ~p"/submitter_autocomplete")
  end
end
