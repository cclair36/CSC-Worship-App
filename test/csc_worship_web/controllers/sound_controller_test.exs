defmodule CscWorshipWeb.SoundControllerTest do
  use CscWorshipWeb.ConnCase

  import CscWorship.MusiciansFixtures

  @create_attrs %{name: "some name", dates_avaliable: [], email: "some email"}
  @update_attrs %{name: "some updated name", dates_avaliable: [], email: "some updated email"}
  @invalid_attrs %{name: nil, dates_avaliable: nil, email: nil}

  describe "index" do
    test "lists all sounds", %{conn: conn} do
      conn = get(conn, ~p"/sounds")
      assert html_response(conn, 200) =~ "Listing Sounds"
    end
  end

  describe "new sound" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/sounds/new")
      assert html_response(conn, 200) =~ "New Sound"
    end
  end

  describe "create sound" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/sounds", sound: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/sounds/#{id}"

      conn = get(conn, ~p"/sounds/#{id}")
      assert html_response(conn, 200) =~ "Sound #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/sounds", sound: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Sound"
    end
  end

  describe "edit sound" do
    setup [:create_sound]

    test "renders form for editing chosen sound", %{conn: conn, sound: sound} do
      conn = get(conn, ~p"/sounds/#{sound}/edit")
      assert html_response(conn, 200) =~ "Edit Sound"
    end
  end

  describe "update sound" do
    setup [:create_sound]

    test "redirects when data is valid", %{conn: conn, sound: sound} do
      conn = put(conn, ~p"/sounds/#{sound}", sound: @update_attrs)
      assert redirected_to(conn) == ~p"/sounds/#{sound}"

      conn = get(conn, ~p"/sounds/#{sound}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, sound: sound} do
      conn = put(conn, ~p"/sounds/#{sound}", sound: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Sound"
    end
  end

  describe "delete sound" do
    setup [:create_sound]

    test "deletes chosen sound", %{conn: conn, sound: sound} do
      conn = delete(conn, ~p"/sounds/#{sound}")
      assert redirected_to(conn) == ~p"/sounds"

      assert_error_sent 404, fn ->
        get(conn, ~p"/sounds/#{sound}")
      end
    end
  end

  defp create_sound(_) do
    sound = sound_fixture()
    %{sound: sound}
  end
end
