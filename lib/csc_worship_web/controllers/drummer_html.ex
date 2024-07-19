defmodule CscWorshipWeb.DrummerHTML do
  use CscWorshipWeb, :html

  embed_templates "drummer_html/*"

  @doc """
  Renders a drummer form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def drummer_form(assigns)
end
