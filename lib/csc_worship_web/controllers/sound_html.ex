defmodule CscWorshipWeb.SoundHTML do
  use CscWorshipWeb, :html

  embed_templates "sound_html/*"

  @doc """
  Renders a sound form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def sound_form(assigns)
end
