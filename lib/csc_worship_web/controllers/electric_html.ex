defmodule CscWorshipWeb.ElectricHTML do
  use CscWorshipWeb, :html

  embed_templates "electric_html/*"

  @doc """
  Renders a electric form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def electric_form(assigns)
end
