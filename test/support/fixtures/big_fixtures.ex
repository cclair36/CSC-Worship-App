defmodule CscWorship.BigFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `CscWorship.Big` context.
  """

  @doc """
  Generate a service.
  """
  def service_fixture(attrs \\ %{}) do
    {:ok, service} =
      attrs
      |> Enum.into(%{
        date: ~U[2024-07-12 21:32:00Z],
        notes: "some notes",
        rehearsal_time1: ~U[2024-07-12 21:32:00Z],
        rehearsal_time_2: ~U[2024-07-12 21:32:00Z],
        songs: ["option1", "option2"],
        submitter: "some submitter"
      })
      |> CscWorship.Big.create_service()

    service
  end

  @doc """
  Generate a song.
  """
  def song_fixture(attrs \\ %{}) do
    {:ok, song} =
      attrs
      |> Enum.into(%{
        artist: "some artist",
        name: "some name",
        songselect: "some songselect",
        type: "some type",
        youtube: "some youtube"
      })
      |> CscWorship.Big.create_song()

    song
  end
end
