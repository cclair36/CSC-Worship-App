defmodule CscWorship.MusiciansTest do
  use CscWorship.DataCase

  alias CscWorship.Musicians

  describe "drummers" do
    alias CscWorship.Musicians.Drummer

    import CscWorship.MusiciansFixtures

    @invalid_attrs %{name: nil, dates_avaliable: nil, cajon_only: nil}

    test "list_drummers/0 returns all drummers" do
      drummer = drummer_fixture()
      assert Musicians.list_drummers() == [drummer]
    end

    test "get_drummer!/1 returns the drummer with given id" do
      drummer = drummer_fixture()
      assert Musicians.get_drummer!(drummer.id) == drummer
    end

    test "create_drummer/1 with valid data creates a drummer" do
      valid_attrs = %{name: "some name", dates_avaliable: [], cajon_only: true}

      assert {:ok, %Drummer{} = drummer} = Musicians.create_drummer(valid_attrs)
      assert drummer.name == "some name"
      assert drummer.dates_avaliable == []
      assert drummer.cajon_only == true
    end

    test "create_drummer/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Musicians.create_drummer(@invalid_attrs)
    end

    test "update_drummer/2 with valid data updates the drummer" do
      drummer = drummer_fixture()
      update_attrs = %{name: "some updated name", dates_avaliable: [], cajon_only: false}

      assert {:ok, %Drummer{} = drummer} = Musicians.update_drummer(drummer, update_attrs)
      assert drummer.name == "some updated name"
      assert drummer.dates_avaliable == []
      assert drummer.cajon_only == false
    end

    test "update_drummer/2 with invalid data returns error changeset" do
      drummer = drummer_fixture()
      assert {:error, %Ecto.Changeset{}} = Musicians.update_drummer(drummer, @invalid_attrs)
      assert drummer == Musicians.get_drummer!(drummer.id)
    end

    test "delete_drummer/1 deletes the drummer" do
      drummer = drummer_fixture()
      assert {:ok, %Drummer{}} = Musicians.delete_drummer(drummer)
      assert_raise Ecto.NoResultsError, fn -> Musicians.get_drummer!(drummer.id) end
    end

    test "change_drummer/1 returns a drummer changeset" do
      drummer = drummer_fixture()
      assert %Ecto.Changeset{} = Musicians.change_drummer(drummer)
    end
  end

  describe "keyboards" do
    alias CscWorship.Musicians.Keyboard

    import CscWorship.MusiciansFixtures

    @invalid_attrs %{name: nil, dates_avaliable: nil, email: nil}

    test "list_keyboards/0 returns all keyboards" do
      keyboard = keyboard_fixture()
      assert Musicians.list_keyboards() == [keyboard]
    end

    test "get_keyboard!/1 returns the keyboard with given id" do
      keyboard = keyboard_fixture()
      assert Musicians.get_keyboard!(keyboard.id) == keyboard
    end

    test "create_keyboard/1 with valid data creates a keyboard" do
      valid_attrs = %{name: "some name", dates_avaliable: [], email: "some email"}

      assert {:ok, %Keyboard{} = keyboard} = Musicians.create_keyboard(valid_attrs)
      assert keyboard.name == "some name"
      assert keyboard.dates_avaliable == []
      assert keyboard.email == "some email"
    end

    test "create_keyboard/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Musicians.create_keyboard(@invalid_attrs)
    end

    test "update_keyboard/2 with valid data updates the keyboard" do
      keyboard = keyboard_fixture()
      update_attrs = %{name: "some updated name", dates_avaliable: [], email: "some updated email"}

      assert {:ok, %Keyboard{} = keyboard} = Musicians.update_keyboard(keyboard, update_attrs)
      assert keyboard.name == "some updated name"
      assert keyboard.dates_avaliable == []
      assert keyboard.email == "some updated email"
    end

    test "update_keyboard/2 with invalid data returns error changeset" do
      keyboard = keyboard_fixture()
      assert {:error, %Ecto.Changeset{}} = Musicians.update_keyboard(keyboard, @invalid_attrs)
      assert keyboard == Musicians.get_keyboard!(keyboard.id)
    end

    test "delete_keyboard/1 deletes the keyboard" do
      keyboard = keyboard_fixture()
      assert {:ok, %Keyboard{}} = Musicians.delete_keyboard(keyboard)
      assert_raise Ecto.NoResultsError, fn -> Musicians.get_keyboard!(keyboard.id) end
    end

    test "change_keyboard/1 returns a keyboard changeset" do
      keyboard = keyboard_fixture()
      assert %Ecto.Changeset{} = Musicians.change_keyboard(keyboard)
    end
  end

  describe "ac_guitar" do
    alias CscWorship.Musicians.Acoustic

    import CscWorship.MusiciansFixtures

    @invalid_attrs %{name: nil, dates_avaliable: nil, email: nil}

    test "list_ac_guitar/0 returns all ac_guitar" do
      acoustic = acoustic_fixture()
      assert Musicians.list_ac_guitar() == [acoustic]
    end

    test "get_acoustic!/1 returns the acoustic with given id" do
      acoustic = acoustic_fixture()
      assert Musicians.get_acoustic!(acoustic.id) == acoustic
    end

    test "create_acoustic/1 with valid data creates a acoustic" do
      valid_attrs = %{name: "some name", dates_avaliable: [], email: "some email"}

      assert {:ok, %Acoustic{} = acoustic} = Musicians.create_acoustic(valid_attrs)
      assert acoustic.name == "some name"
      assert acoustic.dates_avaliable == []
      assert acoustic.email == "some email"
    end

    test "create_acoustic/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Musicians.create_acoustic(@invalid_attrs)
    end

    test "update_acoustic/2 with valid data updates the acoustic" do
      acoustic = acoustic_fixture()
      update_attrs = %{name: "some updated name", dates_avaliable: [], email: "some updated email"}

      assert {:ok, %Acoustic{} = acoustic} = Musicians.update_acoustic(acoustic, update_attrs)
      assert acoustic.name == "some updated name"
      assert acoustic.dates_avaliable == []
      assert acoustic.email == "some updated email"
    end

    test "update_acoustic/2 with invalid data returns error changeset" do
      acoustic = acoustic_fixture()
      assert {:error, %Ecto.Changeset{}} = Musicians.update_acoustic(acoustic, @invalid_attrs)
      assert acoustic == Musicians.get_acoustic!(acoustic.id)
    end

    test "delete_acoustic/1 deletes the acoustic" do
      acoustic = acoustic_fixture()
      assert {:ok, %Acoustic{}} = Musicians.delete_acoustic(acoustic)
      assert_raise Ecto.NoResultsError, fn -> Musicians.get_acoustic!(acoustic.id) end
    end

    test "change_acoustic/1 returns a acoustic changeset" do
      acoustic = acoustic_fixture()
      assert %Ecto.Changeset{} = Musicians.change_acoustic(acoustic)
    end
  end

  describe "el_guitar" do
    alias CscWorship.Musicians.Electric

    import CscWorship.MusiciansFixtures

    @invalid_attrs %{name: nil, dates_avaliable: nil, email: nil}

    test "list_el_guitar/0 returns all el_guitar" do
      electric = electric_fixture()
      assert Musicians.list_el_guitar() == [electric]
    end

    test "get_electric!/1 returns the electric with given id" do
      electric = electric_fixture()
      assert Musicians.get_electric!(electric.id) == electric
    end

    test "create_electric/1 with valid data creates a electric" do
      valid_attrs = %{name: "some name", dates_avaliable: [], email: "some email"}

      assert {:ok, %Electric{} = electric} = Musicians.create_electric(valid_attrs)
      assert electric.name == "some name"
      assert electric.dates_avaliable == []
      assert electric.email == "some email"
    end

    test "create_electric/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Musicians.create_electric(@invalid_attrs)
    end

    test "update_electric/2 with valid data updates the electric" do
      electric = electric_fixture()
      update_attrs = %{name: "some updated name", dates_avaliable: [], email: "some updated email"}

      assert {:ok, %Electric{} = electric} = Musicians.update_electric(electric, update_attrs)
      assert electric.name == "some updated name"
      assert electric.dates_avaliable == []
      assert electric.email == "some updated email"
    end

    test "update_electric/2 with invalid data returns error changeset" do
      electric = electric_fixture()
      assert {:error, %Ecto.Changeset{}} = Musicians.update_electric(electric, @invalid_attrs)
      assert electric == Musicians.get_electric!(electric.id)
    end

    test "delete_electric/1 deletes the electric" do
      electric = electric_fixture()
      assert {:ok, %Electric{}} = Musicians.delete_electric(electric)
      assert_raise Ecto.NoResultsError, fn -> Musicians.get_electric!(electric.id) end
    end

    test "change_electric/1 returns a electric changeset" do
      electric = electric_fixture()
      assert %Ecto.Changeset{} = Musicians.change_electric(electric)
    end
  end

  describe "vocalists" do
    alias CscWorship.Musicians.Vocalist

    import CscWorship.MusiciansFixtures

    @invalid_attrs %{name: nil, dates_avaliable: nil, email: nil}

    test "list_vocalists/0 returns all vocalists" do
      vocalist = vocalist_fixture()
      assert Musicians.list_vocalists() == [vocalist]
    end

    test "get_vocalist!/1 returns the vocalist with given id" do
      vocalist = vocalist_fixture()
      assert Musicians.get_vocalist!(vocalist.id) == vocalist
    end

    test "create_vocalist/1 with valid data creates a vocalist" do
      valid_attrs = %{name: "some name", dates_avaliable: [], email: "some email"}

      assert {:ok, %Vocalist{} = vocalist} = Musicians.create_vocalist(valid_attrs)
      assert vocalist.name == "some name"
      assert vocalist.dates_avaliable == []
      assert vocalist.email == "some email"
    end

    test "create_vocalist/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Musicians.create_vocalist(@invalid_attrs)
    end

    test "update_vocalist/2 with valid data updates the vocalist" do
      vocalist = vocalist_fixture()
      update_attrs = %{name: "some updated name", dates_avaliable: [], email: "some updated email"}

      assert {:ok, %Vocalist{} = vocalist} = Musicians.update_vocalist(vocalist, update_attrs)
      assert vocalist.name == "some updated name"
      assert vocalist.dates_avaliable == []
      assert vocalist.email == "some updated email"
    end

    test "update_vocalist/2 with invalid data returns error changeset" do
      vocalist = vocalist_fixture()
      assert {:error, %Ecto.Changeset{}} = Musicians.update_vocalist(vocalist, @invalid_attrs)
      assert vocalist == Musicians.get_vocalist!(vocalist.id)
    end

    test "delete_vocalist/1 deletes the vocalist" do
      vocalist = vocalist_fixture()
      assert {:ok, %Vocalist{}} = Musicians.delete_vocalist(vocalist)
      assert_raise Ecto.NoResultsError, fn -> Musicians.get_vocalist!(vocalist.id) end
    end

    test "change_vocalist/1 returns a vocalist changeset" do
      vocalist = vocalist_fixture()
      assert %Ecto.Changeset{} = Musicians.change_vocalist(vocalist)
    end
  end

  describe "slides" do
    alias CscWorship.Musicians.Slide

    import CscWorship.MusiciansFixtures

    @invalid_attrs %{name: nil, dates_avaliable: nil, email: nil}

    test "list_slides/0 returns all slides" do
      slide = slide_fixture()
      assert Musicians.list_slides() == [slide]
    end

    test "get_slide!/1 returns the slide with given id" do
      slide = slide_fixture()
      assert Musicians.get_slide!(slide.id) == slide
    end

    test "create_slide/1 with valid data creates a slide" do
      valid_attrs = %{name: "some name", dates_avaliable: [], email: "some email"}

      assert {:ok, %Slide{} = slide} = Musicians.create_slide(valid_attrs)
      assert slide.name == "some name"
      assert slide.dates_avaliable == []
      assert slide.email == "some email"
    end

    test "create_slide/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Musicians.create_slide(@invalid_attrs)
    end

    test "update_slide/2 with valid data updates the slide" do
      slide = slide_fixture()
      update_attrs = %{name: "some updated name", dates_avaliable: [], email: "some updated email"}

      assert {:ok, %Slide{} = slide} = Musicians.update_slide(slide, update_attrs)
      assert slide.name == "some updated name"
      assert slide.dates_avaliable == []
      assert slide.email == "some updated email"
    end

    test "update_slide/2 with invalid data returns error changeset" do
      slide = slide_fixture()
      assert {:error, %Ecto.Changeset{}} = Musicians.update_slide(slide, @invalid_attrs)
      assert slide == Musicians.get_slide!(slide.id)
    end

    test "delete_slide/1 deletes the slide" do
      slide = slide_fixture()
      assert {:ok, %Slide{}} = Musicians.delete_slide(slide)
      assert_raise Ecto.NoResultsError, fn -> Musicians.get_slide!(slide.id) end
    end

    test "change_slide/1 returns a slide changeset" do
      slide = slide_fixture()
      assert %Ecto.Changeset{} = Musicians.change_slide(slide)
    end
  end

  describe "sounds" do
    alias CscWorship.Musicians.Sound

    import CscWorship.MusiciansFixtures

    @invalid_attrs %{name: nil, dates_avaliable: nil, email: nil}

    test "list_sounds/0 returns all sounds" do
      sound = sound_fixture()
      assert Musicians.list_sounds() == [sound]
    end

    test "get_sound!/1 returns the sound with given id" do
      sound = sound_fixture()
      assert Musicians.get_sound!(sound.id) == sound
    end

    test "create_sound/1 with valid data creates a sound" do
      valid_attrs = %{name: "some name", dates_avaliable: [], email: "some email"}

      assert {:ok, %Sound{} = sound} = Musicians.create_sound(valid_attrs)
      assert sound.name == "some name"
      assert sound.dates_avaliable == []
      assert sound.email == "some email"
    end

    test "create_sound/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Musicians.create_sound(@invalid_attrs)
    end

    test "update_sound/2 with valid data updates the sound" do
      sound = sound_fixture()
      update_attrs = %{name: "some updated name", dates_avaliable: [], email: "some updated email"}

      assert {:ok, %Sound{} = sound} = Musicians.update_sound(sound, update_attrs)
      assert sound.name == "some updated name"
      assert sound.dates_avaliable == []
      assert sound.email == "some updated email"
    end

    test "update_sound/2 with invalid data returns error changeset" do
      sound = sound_fixture()
      assert {:error, %Ecto.Changeset{}} = Musicians.update_sound(sound, @invalid_attrs)
      assert sound == Musicians.get_sound!(sound.id)
    end

    test "delete_sound/1 deletes the sound" do
      sound = sound_fixture()
      assert {:ok, %Sound{}} = Musicians.delete_sound(sound)
      assert_raise Ecto.NoResultsError, fn -> Musicians.get_sound!(sound.id) end
    end

    test "change_sound/1 returns a sound changeset" do
      sound = sound_fixture()
      assert %Ecto.Changeset{} = Musicians.change_sound(sound)
    end
  end

  describe "speakers" do
    alias CscWorship.Musicians.Speaker

    import CscWorship.MusiciansFixtures

    @invalid_attrs %{name: nil, dates_preaching: nil, email: nil}

    test "list_speakers/0 returns all speakers" do
      speaker = speaker_fixture()
      assert Musicians.list_speakers() == [speaker]
    end

    test "get_speaker!/1 returns the speaker with given id" do
      speaker = speaker_fixture()
      assert Musicians.get_speaker!(speaker.id) == speaker
    end

    test "create_speaker/1 with valid data creates a speaker" do
      valid_attrs = %{name: "some name", dates_preaching: [], email: "some email"}

      assert {:ok, %Speaker{} = speaker} = Musicians.create_speaker(valid_attrs)
      assert speaker.name == "some name"
      assert speaker.dates_preaching == []
      assert speaker.email == "some email"
    end

    test "create_speaker/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Musicians.create_speaker(@invalid_attrs)
    end

    test "update_speaker/2 with valid data updates the speaker" do
      speaker = speaker_fixture()
      update_attrs = %{name: "some updated name", dates_preaching: [], email: "some updated email"}

      assert {:ok, %Speaker{} = speaker} = Musicians.update_speaker(speaker, update_attrs)
      assert speaker.name == "some updated name"
      assert speaker.dates_preaching == []
      assert speaker.email == "some updated email"
    end

    test "update_speaker/2 with invalid data returns error changeset" do
      speaker = speaker_fixture()
      assert {:error, %Ecto.Changeset{}} = Musicians.update_speaker(speaker, @invalid_attrs)
      assert speaker == Musicians.get_speaker!(speaker.id)
    end

    test "delete_speaker/1 deletes the speaker" do
      speaker = speaker_fixture()
      assert {:ok, %Speaker{}} = Musicians.delete_speaker(speaker)
      assert_raise Ecto.NoResultsError, fn -> Musicians.get_speaker!(speaker.id) end
    end

    test "change_speaker/1 returns a speaker changeset" do
      speaker = speaker_fixture()
      assert %Ecto.Changeset{} = Musicians.change_speaker(speaker)
    end
  end

  describe "submitter_autocomplete" do
    alias CscWorship.Musicians.SubmitterAutocomplete

    import CscWorship.MusiciansFixtures

    @invalid_attrs %{name: nil}

    test "list_submitter_autocomplete/0 returns all submitter_autocomplete" do
      submitter_autocomplete = submitter_autocomplete_fixture()
      assert Musicians.list_submitter_autocomplete() == [submitter_autocomplete]
    end

    test "get_submitter_autocomplete!/1 returns the submitter_autocomplete with given id" do
      submitter_autocomplete = submitter_autocomplete_fixture()
      assert Musicians.get_submitter_autocomplete!(submitter_autocomplete.id) == submitter_autocomplete
    end

    test "create_submitter_autocomplete/1 with valid data creates a submitter_autocomplete" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %SubmitterAutocomplete{} = submitter_autocomplete} = Musicians.create_submitter_autocomplete(valid_attrs)
      assert submitter_autocomplete.name == "some name"
    end

    test "create_submitter_autocomplete/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Musicians.create_submitter_autocomplete(@invalid_attrs)
    end

    test "update_submitter_autocomplete/2 with valid data updates the submitter_autocomplete" do
      submitter_autocomplete = submitter_autocomplete_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %SubmitterAutocomplete{} = submitter_autocomplete} = Musicians.update_submitter_autocomplete(submitter_autocomplete, update_attrs)
      assert submitter_autocomplete.name == "some updated name"
    end

    test "update_submitter_autocomplete/2 with invalid data returns error changeset" do
      submitter_autocomplete = submitter_autocomplete_fixture()
      assert {:error, %Ecto.Changeset{}} = Musicians.update_submitter_autocomplete(submitter_autocomplete, @invalid_attrs)
      assert submitter_autocomplete == Musicians.get_submitter_autocomplete!(submitter_autocomplete.id)
    end

    test "delete_submitter_autocomplete/1 deletes the submitter_autocomplete" do
      submitter_autocomplete = submitter_autocomplete_fixture()
      assert {:ok, %SubmitterAutocomplete{}} = Musicians.delete_submitter_autocomplete(submitter_autocomplete)
      assert_raise Ecto.NoResultsError, fn -> Musicians.get_submitter_autocomplete!(submitter_autocomplete.id) end
    end

    test "change_submitter_autocomplete/1 returns a submitter_autocomplete changeset" do
      submitter_autocomplete = submitter_autocomplete_fixture()
      assert %Ecto.Changeset{} = Musicians.change_submitter_autocomplete(submitter_autocomplete)
    end
  end

  describe "bassists" do
    alias CscWorship.Musicians.Bassist

    import CscWorship.MusiciansFixtures

    @invalid_attrs %{name: nil, dates_unavailable: nil, email: nil, times_used: nil}

    test "list_bassists/0 returns all bassists" do
      bassist = bassist_fixture()
      assert Musicians.list_bassists() == [bassist]
    end

    test "get_bassist!/1 returns the bassist with given id" do
      bassist = bassist_fixture()
      assert Musicians.get_bassist!(bassist.id) == bassist
    end

    test "create_bassist/1 with valid data creates a bassist" do
      valid_attrs = %{name: "some name", dates_unavailable: [], email: "some email", times_used: 42}

      assert {:ok, %Bassist{} = bassist} = Musicians.create_bassist(valid_attrs)
      assert bassist.name == "some name"
      assert bassist.dates_unavailable == []
      assert bassist.email == "some email"
      assert bassist.times_used == 42
    end

    test "create_bassist/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Musicians.create_bassist(@invalid_attrs)
    end

    test "update_bassist/2 with valid data updates the bassist" do
      bassist = bassist_fixture()
      update_attrs = %{name: "some updated name", dates_unavailable: [], email: "some updated email", times_used: 43}

      assert {:ok, %Bassist{} = bassist} = Musicians.update_bassist(bassist, update_attrs)
      assert bassist.name == "some updated name"
      assert bassist.dates_unavailable == []
      assert bassist.email == "some updated email"
      assert bassist.times_used == 43
    end

    test "update_bassist/2 with invalid data returns error changeset" do
      bassist = bassist_fixture()
      assert {:error, %Ecto.Changeset{}} = Musicians.update_bassist(bassist, @invalid_attrs)
      assert bassist == Musicians.get_bassist!(bassist.id)
    end

    test "delete_bassist/1 deletes the bassist" do
      bassist = bassist_fixture()
      assert {:ok, %Bassist{}} = Musicians.delete_bassist(bassist)
      assert_raise Ecto.NoResultsError, fn -> Musicians.get_bassist!(bassist.id) end
    end

    test "change_bassist/1 returns a bassist changeset" do
      bassist = bassist_fixture()
      assert %Ecto.Changeset{} = Musicians.change_bassist(bassist)
    end
  end
end
