defmodule CscWorshipWeb.KeyboardHTML do
  use CscWorshipWeb, :html

  embed_templates "keyboard_html/*"

  @doc """
  Renders a keyboard form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def keyboard_form(assigns)
  def date_list(_changeset) do
    p = CscWorship.Big.list_service_dates
    p2 = Enum.map(p, fn x ->
      Date.to_string(x)
    end)
    p2 ++ ["1969-01-01"]
  end
end
