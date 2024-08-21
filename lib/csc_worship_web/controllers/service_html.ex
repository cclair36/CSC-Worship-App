defmodule CscWorshipWeb.ServiceHTML do
  use CscWorshipWeb, :html

  embed_templates "service_html/*"

  @doc """
  Renders a service form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def service_form(assigns)

  def songlist() do
   CscWorship.Big.list_song_names()
  end
  def drummer_dropdown(_changeset, date) do
    for %CscWorship.Musicians.Drummer{id: id, name: name} <- CscWorship.Musicians.list_drummers(date) do
      [key: name, value: id]
    end
  end
  def bass_dropdown(_changeset, date) do
    for %CscWorship.Musicians.Bassist{id: id, name: name} <- CscWorship.Musicians.list_bassists(date) do
      [key: name, value: id]
    end
  end
  def sound_dropdown(_changeset, date) do
    for %CscWorship.Musicians.Sound{id: id, name: name} <- CscWorship.Musicians.list_sounds(date) do
      [key: name, value: id]
    end
  end
    def vocalist_dropdown(_changeset, date) do
      for %CscWorship.Musicians.Vocalist{id: id, name: name} <- CscWorship.Musicians.list_vocalists(date) do
        [key: name, value: id]
  end
end
def electric_dropdown(_changeset, date) do
  for %CscWorship.Musicians.Electric{id: id, name: name} <- CscWorship.Musicians.list_el_guitar(date) do
    [key: name, value: id]
end
end
def acoustic_dropdown(_changeset, date) do
  for %CscWorship.Musicians.Acoustic{id: id, name: name} <- CscWorship.Musicians.list_ac_guitar(date) do
    [key: name, value: id]
end
end
def keyboard_dropdown(_changeset, date) do
  for %CscWorship.Musicians.Keyboard{id: id, name: name} <- CscWorship.Musicians.list_keyboards(date) do
    [key: name, value: id]
end
end
def slides_dropdown(_changeset, date) do
  for %CscWorship.Musicians.Slide{id: id, name: name} <- CscWorship.Musicians.list_slides(date) do
    [key: name, value: id]
end
end
def speaker_dropdown(_changeset) do
  for %CscWorship.Musicians.Speaker{id: id, name: name} <- CscWorship.Musicians.list_speakers() do
    [key: name, value: id]
end
end
end
