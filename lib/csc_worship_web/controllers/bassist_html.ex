defmodule CscWorshipWeb.BassistHTML do
  use CscWorshipWeb, :html

  embed_templates "bassist_html/*"

  @doc """
  Renders a bassist form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def bassist_form(assigns)
end
