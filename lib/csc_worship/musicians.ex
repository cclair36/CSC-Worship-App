defmodule CscWorship.Musicians do
  @moduledoc """
  The Musicians context.
  """

  import Ecto.Query, warn: false
  alias CscWorship.Repo

  alias CscWorship.Musicians.Drummer

  @doc """
  Returns the list of drummers.

  ## Examples

      iex> list_drummers()
      [%Drummer{}, ...]

  """
  def list_drummers(date2 \\nil)  do
    if date2 != nil do
      date = DateTime.to_date(date2)
    query =
      from a in Drummer,
        where: not fragment("? @> ?", a.dates_avaliable, ^[date])
      Repo.all(query)
    else
      Repo.all(Drummer)
  end
end

  @doc """
  Gets a single drummer.

  Raises `Ecto.NoResultsError` if the Drummer does not exist.

  ## Examples

      iex> get_drummer!(123)
      %Drummer{}

      iex> get_drummer!(456)
      ** (Ecto.NoResultsError)

  """
  def get_drummer!(id), do: Repo.get!(Drummer, id)

  @doc """
  Creates a drummer.

  ## Examples

      iex> create_drummer(%{field: value})
      {:ok, %Drummer{}}

      iex> create_drummer(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_drummer(attrs \\ %{}) do
    %Drummer{}
    |> Drummer.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a drummer.

  ## Examples

      iex> update_drummer(drummer, %{field: new_value})
      {:ok, %Drummer{}}

      iex> update_drummer(drummer, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_drummer(%Drummer{} = drummer, attrs) do
    drummer
    |> Drummer.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a drummer.

  ## Examples

      iex> delete_drummer(drummer)
      {:ok, %Drummer{}}

      iex> delete_drummer(drummer)
      {:error, %Ecto.Changeset{}}

  """
  def delete_drummer(%Drummer{} = drummer) do
    Repo.delete(drummer)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking drummer changes.

  ## Examples

      iex> change_drummer(drummer)
      %Ecto.Changeset{data: %Drummer{}}

  """
  def change_drummer(%Drummer{} = drummer, attrs \\ %{}) do
    Drummer.changeset(drummer, attrs)
  end

  alias CscWorship.Musicians.Keyboard

  @doc """
  Returns the list of keyboards.

  ## Examples

      iex> list_keyboards()
      [%Keyboard{}, ...]

  """
  def list_keyboards(date2 \\nil)  do
    if date2 != nil do
      date = DateTime.to_date(date2)
    query =
      from a in Keyboard,
        where: not fragment("? @> ?", a.dates_avaliable, ^[date])
    Repo.all(query)
    else
      Repo.all(Keyboard)
  end
end

  @doc """
  Gets a single keyboard.

  Raises `Ecto.NoResultsError` if the Keyboard does not exist.

  ## Examples

      iex> get_keyboard!(123)
      %Keyboard{}

      iex> get_keyboard!(456)
      ** (Ecto.NoResultsError)

  """
  def get_keyboard!(id), do: Repo.get!(Keyboard, id)

  @doc """
  Creates a keyboard.

  ## Examples

      iex> create_keyboard(%{field: value})
      {:ok, %Keyboard{}}

      iex> create_keyboard(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_keyboard(attrs \\ %{}) do
    %Keyboard{}
    |> Keyboard.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a keyboard.

  ## Examples

      iex> update_keyboard(keyboard, %{field: new_value})
      {:ok, %Keyboard{}}

      iex> update_keyboard(keyboard, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_keyboard(%Keyboard{} = keyboard, attrs) do
    keyboard
    |> Keyboard.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a keyboard.

  ## Examples

      iex> delete_keyboard(keyboard)
      {:ok, %Keyboard{}}

      iex> delete_keyboard(keyboard)
      {:error, %Ecto.Changeset{}}

  """
  def delete_keyboard(%Keyboard{} = keyboard) do
    Repo.delete(keyboard)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking keyboard changes.

  ## Examples

      iex> change_keyboard(keyboard)
      %Ecto.Changeset{data: %Keyboard{}}

  """
  def change_keyboard(%Keyboard{} = keyboard, attrs \\ %{}) do
    Keyboard.changeset(keyboard, attrs)
  end

  alias CscWorship.Musicians.Acoustic

  @doc """
  Returns the list of ac_guitar.

  ## Examples

      iex> list_ac_guitar()
      [%Acoustic{}, ...]

  """
  def list_ac_guitar(date2 \\ nil) do
    if date2 != nil do
      date = DateTime.to_date(date2)
    query =
      from a in Acoustic,
        where: not fragment("? @> ?", a.dates_avaliable, ^[date])

    Repo.all(query)
    else
    Repo.all(Acoustic)
    end
  end

  @doc """
  Gets a single acoustic.

  Raises `Ecto.NoResultsError` if the Acoustic does not exist.

  ## Examples

      iex> get_acoustic!(123)
      %Acoustic{}

      iex> get_acoustic!(456)
      ** (Ecto.NoResultsError)

  """
  def get_acoustic!(id), do: Repo.get!(Acoustic, id)

  @doc """
  Creates a acoustic.

  ## Examples

      iex> create_acoustic(%{field: value})
      {:ok, %Acoustic{}}

      iex> create_acoustic(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_acoustic(attrs \\ %{}) do
    %Acoustic{}
    |> Acoustic.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a acoustic.

  ## Examples

      iex> update_acoustic(acoustic, %{field: new_value})
      {:ok, %Acoustic{}}

      iex> update_acoustic(acoustic, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_acoustic(%Acoustic{} = acoustic, attrs) do
    acoustic
    |> Acoustic.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a acoustic.

  ## Examples

      iex> delete_acoustic(acoustic)
      {:ok, %Acoustic{}}

      iex> delete_acoustic(acoustic)
      {:error, %Ecto.Changeset{}}

  """
  def delete_acoustic(%Acoustic{} = acoustic) do
    Repo.delete(acoustic)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking acoustic changes.

  ## Examples

      iex> change_acoustic(acoustic)
      %Ecto.Changeset{data: %Acoustic{}}

  """
  def change_acoustic(%Acoustic{} = acoustic, attrs \\ %{}) do
    Acoustic.changeset(acoustic, attrs)
  end

  alias CscWorship.Musicians.Electric

  @doc """
  Returns the list of el_guitar.

  ## Examples

      iex> list_el_guitar()
      [%Electric{}, ...]

  """
  def list_el_guitar(date2 \\nil)  do
    if date2 != nil do
      date = DateTime.to_date(date2)
    query =
      from a in Electric,
        where: not fragment("? @> ?", a.dates_avaliable, ^[date])
    Repo.all(query)
    else
    Repo.all(Electric)
    end
  end

  @doc """
  Gets a single electric.

  Raises `Ecto.NoResultsError` if the Electric does not exist.

  ## Examples

      iex> get_electric!(123)
      %Electric{}

      iex> get_electric!(456)
      ** (Ecto.NoResultsError)

  """
  def get_electric!(id), do: Repo.get!(Electric, id)

  @doc """
  Creates a electric.

  ## Examples

      iex> create_electric(%{field: value})
      {:ok, %Electric{}}

      iex> create_electric(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_electric(attrs \\ %{}) do
    %Electric{}
    |> Electric.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a electric.

  ## Examples

      iex> update_electric(electric, %{field: new_value})
      {:ok, %Electric{}}

      iex> update_electric(electric, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_electric(%Electric{} = electric, attrs) do
    electric
    |> Electric.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a electric.

  ## Examples

      iex> delete_electric(electric)
      {:ok, %Electric{}}

      iex> delete_electric(electric)
      {:error, %Ecto.Changeset{}}

  """
  def delete_electric(%Electric{} = electric) do
    Repo.delete(electric)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking electric changes.

  ## Examples

      iex> change_electric(electric)
      %Ecto.Changeset{data: %Electric{}}

  """
  def change_electric(%Electric{} = electric, attrs \\ %{}) do
    Electric.changeset(electric, attrs)
  end

  alias CscWorship.Musicians.Vocalist

  @doc """
  Returns the list of vocalists.

  ## Examples

      iex> list_vocalists()
      [%Vocalist{}, ...]

  """
  def list_vocalists(date2 \\ nil)  do
    if date2 != nil do
      date = DateTime.to_date(date2)
    query =
      from a in Vocalist,
        where: not fragment("? @> ?", a.dates_avaliable, ^[date])
    Repo.all(query)
    else
    Repo.all(Vocalist)
    end
  end

  @doc """
  Gets a single vocalist.

  Raises `Ecto.NoResultsError` if the Vocalist does not exist.

  ## Examples

      iex> get_vocalist!(123)
      %Vocalist{}

      iex> get_vocalist!(456)
      ** (Ecto.NoResultsError)

  """
  def get_vocalist!(id), do: Repo.get!(Vocalist, id)

  @doc """
  Creates a vocalist.

  ## Examples

      iex> create_vocalist(%{field: value})
      {:ok, %Vocalist{}}

      iex> create_vocalist(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_vocalist(attrs \\ %{}) do
    %Vocalist{}
    |> Vocalist.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a vocalist.

  ## Examples

      iex> update_vocalist(vocalist, %{field: new_value})
      {:ok, %Vocalist{}}

      iex> update_vocalist(vocalist, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_vocalist(%Vocalist{} = vocalist, attrs) do
    vocalist
    |> Vocalist.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a vocalist.

  ## Examples

      iex> delete_vocalist(vocalist)
      {:ok, %Vocalist{}}

      iex> delete_vocalist(vocalist)
      {:error, %Ecto.Changeset{}}

  """
  def delete_vocalist(%Vocalist{} = vocalist) do
    Repo.delete(vocalist)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking vocalist changes.

  ## Examples

      iex> change_vocalist(vocalist)
      %Ecto.Changeset{data: %Vocalist{}}

  """
  def change_vocalist(%Vocalist{} = vocalist, attrs \\ %{}) do
    Vocalist.changeset(vocalist, attrs)
  end

  alias CscWorship.Musicians.Slide

  @doc """
  Returns the list of slides.

  ## Examples

      iex> list_slides()
      [%Slide{}, ...]

  """
  def list_slides(date2 \\nil)  do
    if date2 != nil do
      date = DateTime.to_date(date2)
    query =
      from a in Slide,
        where: not fragment("? @> ?", a.dates_avaliable, ^[date])
    Repo.all(query)
    else
    Repo.all(Slide)
    end
  end

  @doc """
  Gets a single slide.

  Raises `Ecto.NoResultsError` if the Slide does not exist.

  ## Examples

      iex> get_slide!(123)
      %Slide{}

      iex> get_slide!(456)
      ** (Ecto.NoResultsError)

  """
  def get_slide!(id), do: Repo.get!(Slide, id)

  @doc """
  Creates a slide.

  ## Examples

      iex> create_slide(%{field: value})
      {:ok, %Slide{}}

      iex> create_slide(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_slide(attrs \\ %{}) do
    %Slide{}
    |> Slide.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a slide.

  ## Examples

      iex> update_slide(slide, %{field: new_value})
      {:ok, %Slide{}}

      iex> update_slide(slide, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_slide(%Slide{} = slide, attrs) do
    slide
    |> Slide.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a slide.

  ## Examples

      iex> delete_slide(slide)
      {:ok, %Slide{}}

      iex> delete_slide(slide)
      {:error, %Ecto.Changeset{}}

  """
  def delete_slide(%Slide{} = slide) do
    Repo.delete(slide)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking slide changes.

  ## Examples

      iex> change_slide(slide)
      %Ecto.Changeset{data: %Slide{}}

  """
  def change_slide(%Slide{} = slide, attrs \\ %{}) do
    Slide.changeset(slide, attrs)
  end

  alias CscWorship.Musicians.Sound

  @doc """
  Returns the list of sounds.

  ## Examples

      iex> list_sounds()
      [%Sound{}, ...]

  """
  def list_sounds(date2 \\nil)  do
    if date2 != nil do
      date = DateTime.to_date(date2)
    query =
      from a in Sound,
        where: not fragment("? @> ?", a.dates_avaliable, ^[date])
    Repo.all(query)
    else
    Repo.all(Sound)
    end
  end

  @doc """
  Gets a single sound.

  Raises `Ecto.NoResultsError` if the Sound does not exist.

  ## Examples

      iex> get_sound!(123)
      %Sound{}

      iex> get_sound!(456)
      ** (Ecto.NoResultsError)

  """
  def get_sound!(id), do: Repo.get!(Sound, id)

  @doc """
  Creates a sound.

  ## Examples

      iex> create_sound(%{field: value})
      {:ok, %Sound{}}

      iex> create_sound(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_sound(attrs \\ %{}) do
    %Sound{}
    |> Sound.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a sound.

  ## Examples

      iex> update_sound(sound, %{field: new_value})
      {:ok, %Sound{}}

      iex> update_sound(sound, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_sound(%Sound{} = sound, attrs) do
    sound
    |> Sound.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a sound.

  ## Examples

      iex> delete_sound(sound)
      {:ok, %Sound{}}

      iex> delete_sound(sound)
      {:error, %Ecto.Changeset{}}

  """
  def delete_sound(%Sound{} = sound) do
    Repo.delete(sound)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking sound changes.

  ## Examples

      iex> change_sound(sound)
      %Ecto.Changeset{data: %Sound{}}

  """
  def change_sound(%Sound{} = sound, attrs \\ %{}) do
    Sound.changeset(sound, attrs)
  end

  alias CscWorship.Musicians.Speaker

  @doc """
  Returns the list of speakers.

  ## Examples

      iex> list_speakers()
      [%Speaker{}, ...]

  """
  def list_speakers do
    Repo.all(Speaker)
  end

  @doc """
  Gets a single speaker.

  Raises `Ecto.NoResultsError` if the Speaker does not exist.

  ## Examples

      iex> get_speaker!(123)
      %Speaker{}

      iex> get_speaker!(456)
      ** (Ecto.NoResultsError)

  """
  def get_speaker!(id), do: Repo.get!(Speaker, id)

  @doc """
  Creates a speaker.

  ## Examples

      iex> create_speaker(%{field: value})
      {:ok, %Speaker{}}

      iex> create_speaker(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_speaker(attrs \\ %{}) do
    %Speaker{}
    |> Speaker.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a speaker.

  ## Examples

      iex> update_speaker(speaker, %{field: new_value})
      {:ok, %Speaker{}}

      iex> update_speaker(speaker, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_speaker(%Speaker{} = speaker, attrs) do
    speaker
    |> Speaker.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a speaker.

  ## Examples

      iex> delete_speaker(speaker)
      {:ok, %Speaker{}}

      iex> delete_speaker(speaker)
      {:error, %Ecto.Changeset{}}

  """
  def delete_speaker(%Speaker{} = speaker) do
    Repo.delete(speaker)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking speaker changes.

  ## Examples

      iex> change_speaker(speaker)
      %Ecto.Changeset{data: %Speaker{}}

  """
  def change_speaker(%Speaker{} = speaker, attrs \\ %{}) do
    Speaker.changeset(speaker, attrs)
  end

  alias CscWorship.Musicians.SubmitterAutocomplete

  @doc """
  Returns the list of submitter_autocomplete.

  ## Examples

      iex> list_submitter_autocomplete()
      [%SubmitterAutocomplete{}, ...]

  """
  def list_submitter_autocomplete do
    Repo.all(SubmitterAutocomplete)
  end

  @doc """
  Gets a single submitter_autocomplete.

  Raises `Ecto.NoResultsError` if the Submitter autocomplete does not exist.

  ## Examples

      iex> get_submitter_autocomplete!(123)
      %SubmitterAutocomplete{}

      iex> get_submitter_autocomplete!(456)
      ** (Ecto.NoResultsError)

  """
  def get_submitter_autocomplete!(id), do: Repo.get!(SubmitterAutocomplete, id)

  @doc """
  Creates a submitter_autocomplete.

  ## Examples

      iex> create_submitter_autocomplete(%{field: value})
      {:ok, %SubmitterAutocomplete{}}

      iex> create_submitter_autocomplete(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_submitter_autocomplete(attrs \\ %{}) do
    %SubmitterAutocomplete{}
    |> SubmitterAutocomplete.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a submitter_autocomplete.

  ## Examples

      iex> update_submitter_autocomplete(submitter_autocomplete, %{field: new_value})
      {:ok, %SubmitterAutocomplete{}}

      iex> update_submitter_autocomplete(submitter_autocomplete, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_submitter_autocomplete(%SubmitterAutocomplete{} = submitter_autocomplete, attrs) do
    submitter_autocomplete
    |> SubmitterAutocomplete.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a submitter_autocomplete.

  ## Examples

      iex> delete_submitter_autocomplete(submitter_autocomplete)
      {:ok, %SubmitterAutocomplete{}}

      iex> delete_submitter_autocomplete(submitter_autocomplete)
      {:error, %Ecto.Changeset{}}

  """
  def delete_submitter_autocomplete(%SubmitterAutocomplete{} = submitter_autocomplete) do
    Repo.delete(submitter_autocomplete)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking submitter_autocomplete changes.

  ## Examples

      iex> change_submitter_autocomplete(submitter_autocomplete)
      %Ecto.Changeset{data: %SubmitterAutocomplete{}}

  """
  def change_submitter_autocomplete(%SubmitterAutocomplete{} = submitter_autocomplete, attrs \\ %{}) do
    SubmitterAutocomplete.changeset(submitter_autocomplete, attrs)
  end

  alias CscWorship.Musicians.Bassist

  @doc """
  Returns the list of bassists.

  ## Examples

      iex> list_bassists()
      [%Bassist{}, ...]

  """
  def list_bassists(date2 \\ nil) do
    if date2 != nil do
      date = DateTime.to_date(date2)
    query =
      from a in Bassist,
        where: not fragment("? @> ?", a.dates_unavailable, ^[date])
    Repo.all(query)
    else
    Repo.all(Bassist)
    end
  end

  @doc """
  Gets a single bassist.

  Raises `Ecto.NoResultsError` if the Bassist does not exist.

  ## Examples

      iex> get_bassist!(123)
      %Bassist{}

      iex> get_bassist!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bassist!(id), do: Repo.get!(Bassist, id)

  @doc """
  Creates a bassist.

  ## Examples

      iex> create_bassist(%{field: value})
      {:ok, %Bassist{}}

      iex> create_bassist(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bassist(attrs \\ %{}) do
    %Bassist{}
    |> Bassist.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bassist.

  ## Examples

      iex> update_bassist(bassist, %{field: new_value})
      {:ok, %Bassist{}}

      iex> update_bassist(bassist, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bassist(%Bassist{} = bassist, attrs) do
    bassist
    |> Bassist.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a bassist.

  ## Examples

      iex> delete_bassist(bassist)
      {:ok, %Bassist{}}

      iex> delete_bassist(bassist)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bassist(%Bassist{} = bassist) do
    Repo.delete(bassist)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bassist changes.

  ## Examples

      iex> change_bassist(bassist)
      %Ecto.Changeset{data: %Bassist{}}

  """
  def change_bassist(%Bassist{} = bassist, attrs \\ %{}) do
    Bassist.changeset(bassist, attrs)
  end

  def find_serving_dates(current_user) do
    list_in_services = [:piano, :acoustic_guitar, :electric_guitar, :singer1, :singer2, :singer3, :singer4, :projection, :sounds, :drums, :sound_board, :bass]
    list_of_services = CscWorship.Big.list_services()
    z =
  Enum.reduce(list_of_services, [], fn service, acc ->
    filtered_attributes =
      Enum.filter(list_in_services, fn attribute ->
        if Map.get(service, attribute) != nil do
              if Map.get(Map.get(service, attribute), :email) == current_user do
                [{DateTime.to_date(service.date), attribute}]
                  end
            end
      end)
    # Now map the filtered attributes to tuples with the date
    acc ++ Enum.map(filtered_attributes, fn attribute ->
      {DateTime.to_date(service.date), attribute}
    end)
  end)
  end
end
