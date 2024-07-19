defmodule CscWorshipWeb.KeyboardControllerTest do
  use CscWorshipWeb.ConnCase

  import CscWorship.MusiciansFixtures

  @create_attrs %{name: "some name", dates_avaliable: [], email: "some email"}
  @update_attrs %{name: "some updated name", dates_avaliable: [], email: "some updated email"}
  @invalid_attrs %{name: nil, dates_avaliable: nil, email: nil}

  describe "index" do
    test "lists all keyboards", %{conn: conn} do
      conn = get(conn, ~p"/keyboards")
      assert html_response(conn, 200) =~ "Listing Keyboards"
    end
  end

  describe "new keyboard" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/keyboards/new")
      assert html_response(conn, 200) =~ "New Keyboard"
    end
  end

  describe "create keyboard" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/keyboards", keyboard: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/keyboards/#{id}"

      conn = get(conn, ~p"/keyboards/#{id}")
      assert html_response(conn, 200) =~ "Keyboard #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/keyboards", keyboard: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Keyboard"
    end
  end

  describe "edit keyboard" do
    setup [:create_keyboard]

    test "renders form for editing chosen keyboard", %{conn: conn, keyboard: keyboard} do
      conn = get(conn, ~p"/keyboards/#{keyboard}/edit")
      assert html_response(conn, 200) =~ "Edit Keyboard"
    end
  end

  describe "update keyboard" do
    setup [:create_keyboard]

    test "redirects when data is valid", %{conn: conn, keyboard: keyboard} do
      conn = put(conn, ~p"/keyboards/#{keyboard}", keyboard: @update_attrs)
      assert redirected_to(conn) == ~p"/keyboards/#{keyboard}"

      conn = get(conn, ~p"/keyboards/#{keyboard}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, keyboard: keyboard} do
      conn = put(conn, ~p"/keyboards/#{keyboard}", keyboard: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Keyboard"
    end
  end

  describe "delete keyboard" do
    setup [:create_keyboard]

    test "deletes chosen keyboard", %{conn: conn, keyboard: keyboard} do
      conn = delete(conn, ~p"/keyboards/#{keyboard}")
      assert redirected_to(conn) == ~p"/keyboards"

      assert_error_sent 404, fn ->
        get(conn, ~p"/keyboards/#{keyboard}")
      end
    end
  end

  defp create_keyboard(_) do
    keyboard = keyboard_fixture()
    %{keyboard: keyboard}
  end
end
