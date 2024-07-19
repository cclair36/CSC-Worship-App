defmodule CscWorshipWeb.VocalistHTML do
  use CscWorshipWeb, :html

  embed_templates "vocalist_html/*"

  @doc """
  Renders a vocalist form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def vocalist_form(assigns)
end
