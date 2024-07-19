defmodule CscWorshipWeb.AcousticHTML do
  use CscWorshipWeb, :html

  embed_templates "acoustic_html/*"

  @doc """
  Renders a acoustic form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def acoustic_form(assigns)
end
