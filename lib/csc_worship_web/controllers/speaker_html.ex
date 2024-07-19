defmodule CscWorshipWeb.SpeakerHTML do
  use CscWorshipWeb, :html

  embed_templates "speaker_html/*"

  @doc """
  Renders a speaker form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def speaker_form(assigns)
end
