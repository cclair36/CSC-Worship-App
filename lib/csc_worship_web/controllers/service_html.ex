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
  def drummer_dropdown(changeset) do
    for %CscWorship.Musicians.Drummer{id: id, name: name} <- CscWorship.Musicians.list_drummers() do
      [key: name, value: id]
    end
  end
  def bass_dropdown(changeset) do
    for %CscWorship.Musicians.Bassist{id: id, name: name} <- CscWorship.Musicians.list_bassists() do
      [key: name, value: id]
    end
  end
  def sound_dropdown(changeset) do
    for %CscWorship.Musicians.Sound{id: id, name: name} <- CscWorship.Musicians.list_sounds() do
      [key: name, value: id]
    end
  end
    def vocalist_dropdown(changeset) do
      for %CscWorship.Musicians.Vocalist{id: id, name: name} <- CscWorship.Musicians.list_vocalists() do
        [key: name, value: id]
  end
end
def electric_dropdown(changeset) do
  for %CscWorship.Musicians.Electric{id: id, name: name} <- CscWorship.Musicians.list_el_guitar() do
    [key: name, value: id]
end
end
def acoustic_dropdown(changeset) do
  for %CscWorship.Musicians.Acoustic{id: id, name: name} <- CscWorship.Musicians.list_ac_guitar() do
    [key: name, value: id]
end
end
def keyboard_dropdown(changeset) do
  for %CscWorship.Musicians.Keyboard{id: id, name: name} <- CscWorship.Musicians.list_keyboards() do
    [key: name, value: id]
end
end
def slides_dropdown(changeset) do
  for %CscWorship.Musicians.Slide{id: id, name: name} <- CscWorship.Musicians.list_slides() do
    [key: name, value: id]
end
end
def speaker_dropdown(changeset) do
  for %CscWorship.Musicians.Speaker{id: id, name: name} <- CscWorship.Musicians.list_speakers() do
    [key: name, value: id]
end
end
# def bass_dropdown(changeset) do
#   for %CscWorship.Musicians.Drummer{id: id, name: name} <- CscWorship.Musicians.list_drummers() do
#     [key: name, value: id]
# end
# end
end
