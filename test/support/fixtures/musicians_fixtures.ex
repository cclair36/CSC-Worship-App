defmodule CscWorship.MusiciansFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CscWorship.Musicians` context.
  """

  @doc """
  Generate a drummer.
  """
  def drummer_fixture(attrs \\ %{}) do
    {:ok, drummer} =
      attrs
      |> Enum.into(%{
        cajon_only: true,
        dates_avaliable: [],
        name: "some name"
      })
      |> CscWorship.Musicians.create_drummer()

    drummer
  end

  @doc """
  Generate a keyboard.
  """
  def keyboard_fixture(attrs \\ %{}) do
    {:ok, keyboard} =
      attrs
      |> Enum.into(%{
        dates_avaliable: [],
        email: "some email",
        name: "some name"
      })
      |> CscWorship.Musicians.create_keyboard()

    keyboard
  end

  @doc """
  Generate a acoustic.
  """
  def acoustic_fixture(attrs \\ %{}) do
    {:ok, acoustic} =
      attrs
      |> Enum.into(%{
        dates_avaliable: [],
        email: "some email",
        name: "some name"
      })
      |> CscWorship.Musicians.create_acoustic()

    acoustic
  end

  @doc """
  Generate a electric.
  """
  def electric_fixture(attrs \\ %{}) do
    {:ok, electric} =
      attrs
      |> Enum.into(%{
        dates_avaliable: [],
        email: "some email",
        name: "some name"
      })
      |> CscWorship.Musicians.create_electric()

    electric
  end

  @doc """
  Generate a vocalist.
  """
  def vocalist_fixture(attrs \\ %{}) do
    {:ok, vocalist} =
      attrs
      |> Enum.into(%{
        dates_avaliable: [],
        email: "some email",
        name: "some name"
      })
      |> CscWorship.Musicians.create_vocalist()

    vocalist
  end

  @doc """
  Generate a slide.
  """
  def slide_fixture(attrs \\ %{}) do
    {:ok, slide} =
      attrs
      |> Enum.into(%{
        dates_avaliable: [],
        email: "some email",
        name: "some name"
      })
      |> CscWorship.Musicians.create_slide()

    slide
  end

  @doc """
  Generate a sound.
  """
  def sound_fixture(attrs \\ %{}) do
    {:ok, sound} =
      attrs
      |> Enum.into(%{
        dates_avaliable: [],
        email: "some email",
        name: "some name"
      })
      |> CscWorship.Musicians.create_sound()

    sound
  end

  @doc """
  Generate a speaker.
  """
  def speaker_fixture(attrs \\ %{}) do
    {:ok, speaker} =
      attrs
      |> Enum.into(%{
        dates_preaching: [],
        email: "some email",
        name: "some name"
      })
      |> CscWorship.Musicians.create_speaker()

    speaker
  end

  @doc """
  Generate a submitter_autocomplete.
  """
  def submitter_autocomplete_fixture(attrs \\ %{}) do
    {:ok, submitter_autocomplete} =
      attrs
      |> Enum.into(%{
        name: "some name"
      })
      |> CscWorship.Musicians.create_submitter_autocomplete()

    submitter_autocomplete
  end

  @doc """
  Generate a bassist.
  """
  def bassist_fixture(attrs \\ %{}) do
    {:ok, bassist} =
      attrs
      |> Enum.into(%{
        dates_unavailable: [],
        email: "some email",
        name: "some name",
        times_used: 42
      })
      |> CscWorship.Musicians.create_bassist()

    bassist
  end
end
