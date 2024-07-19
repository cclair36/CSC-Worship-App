defmodule CscWorship.BigTest do
  use CscWorship.DataCase

  alias CscWorship.Big

  describe "services" do
    alias CscWorship.Big.Service

    import CscWorship.BigFixtures

    @invalid_attrs %{date: nil, songs: nil, notes: nil, submitter: nil, rehearsal_time1: nil, rehearsal_time_2: nil}

    test "list_services/0 returns all services" do
      service = service_fixture()
      assert Big.list_services() == [service]
    end

    test "get_service!/1 returns the service with given id" do
      service = service_fixture()
      assert Big.get_service!(service.id) == service
    end

    test "create_service/1 with valid data creates a service" do
      valid_attrs = %{date: ~U[2024-07-12 21:32:00Z], songs: ["option1", "option2"], notes: "some notes", submitter: "some submitter", rehearsal_time1: ~U[2024-07-12 21:32:00Z], rehearsal_time_2: ~U[2024-07-12 21:32:00Z]}

      assert {:ok, %Service{} = service} = Big.create_service(valid_attrs)
      assert service.date == ~U[2024-07-12 21:32:00Z]
      assert service.songs == ["option1", "option2"]
      assert service.notes == "some notes"
      assert service.submitter == "some submitter"
      assert service.rehearsal_time1 == ~U[2024-07-12 21:32:00Z]
      assert service.rehearsal_time_2 == ~U[2024-07-12 21:32:00Z]
    end

    test "create_service/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Big.create_service(@invalid_attrs)
    end

    test "update_service/2 with valid data updates the service" do
      service = service_fixture()
      update_attrs = %{date: ~U[2024-07-13 21:32:00Z], songs: ["option1"], notes: "some updated notes", submitter: "some updated submitter", rehearsal_time1: ~U[2024-07-13 21:32:00Z], rehearsal_time_2: ~U[2024-07-13 21:32:00Z]}

      assert {:ok, %Service{} = service} = Big.update_service(service, update_attrs)
      assert service.date == ~U[2024-07-13 21:32:00Z]
      assert service.songs == ["option1"]
      assert service.notes == "some updated notes"
      assert service.submitter == "some updated submitter"
      assert service.rehearsal_time1 == ~U[2024-07-13 21:32:00Z]
      assert service.rehearsal_time_2 == ~U[2024-07-13 21:32:00Z]
    end

    test "update_service/2 with invalid data returns error changeset" do
      service = service_fixture()
      assert {:error, %Ecto.Changeset{}} = Big.update_service(service, @invalid_attrs)
      assert service == Big.get_service!(service.id)
    end

    test "delete_service/1 deletes the service" do
      service = service_fixture()
      assert {:ok, %Service{}} = Big.delete_service(service)
      assert_raise Ecto.NoResultsError, fn -> Big.get_service!(service.id) end
    end

    test "change_service/1 returns a service changeset" do
      service = service_fixture()
      assert %Ecto.Changeset{} = Big.change_service(service)
    end
  end

  describe "songs" do
    alias CscWorship.Big.Song

    import CscWorship.BigFixtures

    @invalid_attrs %{name: nil, type: nil, artist: nil, songselect: nil, youtube: nil}

    test "list_songs/0 returns all songs" do
      song = song_fixture()
      assert Big.list_songs() == [song]
    end

    test "get_song!/1 returns the song with given id" do
      song = song_fixture()
      assert Big.get_song!(song.id) == song
    end

    test "create_song/1 with valid data creates a song" do
      valid_attrs = %{name: "some name", type: "some type", artist: "some artist", songselect: "some songselect", youtube: "some youtube"}

      assert {:ok, %Song{} = song} = Big.create_song(valid_attrs)
      assert song.name == "some name"
      assert song.type == "some type"
      assert song.artist == "some artist"
      assert song.songselect == "some songselect"
      assert song.youtube == "some youtube"
    end

    test "create_song/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Big.create_song(@invalid_attrs)
    end

    test "update_song/2 with valid data updates the song" do
      song = song_fixture()
      update_attrs = %{name: "some updated name", type: "some updated type", artist: "some updated artist", songselect: "some updated songselect", youtube: "some updated youtube"}

      assert {:ok, %Song{} = song} = Big.update_song(song, update_attrs)
      assert song.name == "some updated name"
      assert song.type == "some updated type"
      assert song.artist == "some updated artist"
      assert song.songselect == "some updated songselect"
      assert song.youtube == "some updated youtube"
    end

    test "update_song/2 with invalid data returns error changeset" do
      song = song_fixture()
      assert {:error, %Ecto.Changeset{}} = Big.update_song(song, @invalid_attrs)
      assert song == Big.get_song!(song.id)
    end

    test "delete_song/1 deletes the song" do
      song = song_fixture()
      assert {:ok, %Song{}} = Big.delete_song(song)
      assert_raise Ecto.NoResultsError, fn -> Big.get_song!(song.id) end
    end

    test "change_song/1 returns a song changeset" do
      song = song_fixture()
      assert %Ecto.Changeset{} = Big.change_song(song)
    end
  end
end
