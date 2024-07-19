defmodule CscWorshipWeb.SubmitterAutocompleteHTML do
  use CscWorshipWeb, :html

  embed_templates "submitter_autocomplete_html/*"

  @doc """
  Renders a submitter_autocomplete form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def submitter_autocomplete_form(assigns)
end
