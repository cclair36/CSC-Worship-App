defmodule CscWorshipWeb.SlideHTML do
  use CscWorshipWeb, :html

  embed_templates "slide_html/*"

  @doc """
  Renders a slide form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def slide_form(assigns)
end
