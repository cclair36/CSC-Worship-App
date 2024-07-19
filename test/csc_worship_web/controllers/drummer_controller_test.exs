defmodule CscWorshipWeb.DrummerControllerTest do
  use CscWorshipWeb.ConnCase

  import CscWorship.MusiciansFixtures

  @create_attrs %{name: "some name", dates_avaliable: [], cajon_only: true}
  @update_attrs %{name: "some updated name", dates_avaliable: [], cajon_only: false}
  @invalid_attrs %{name: nil, dates_avaliable: nil, cajon_only: nil}

  describe "index" do
    test "lists all drummers", %{conn: conn} do
      conn = get(conn, ~p"/drummers")
      assert html_response(conn, 200) =~ "Listing Drummers"
    end
  end

  describe "new drummer" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/drummers/new")
      assert html_response(conn, 200) =~ "New Drummer"
    end
  end

  describe "create drummer" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/drummers", drummer: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/drummers/#{id}"

      conn = get(conn, ~p"/drummers/#{id}")
      assert html_response(conn, 200) =~ "Drummer #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/drummers", drummer: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Drummer"
    end
  end

  describe "edit drummer" do
    setup [:create_drummer]

    test "renders form for editing chosen drummer", %{conn: conn, drummer: drummer} do
      conn = get(conn, ~p"/drummers/#{drummer}/edit")
      assert html_response(conn, 200) =~ "Edit Drummer"
    end
  end

  describe "update drummer" do
    setup [:create_drummer]

    test "redirects when data is valid", %{conn: conn, drummer: drummer} do
      conn = put(conn, ~p"/drummers/#{drummer}", drummer: @update_attrs)
      assert redirected_to(conn) == ~p"/drummers/#{drummer}"

      conn = get(conn, ~p"/drummers/#{drummer}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, drummer: drummer} do
      conn = put(conn, ~p"/drummers/#{drummer}", drummer: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Drummer"
    end
  end

  describe "delete drummer" do
    setup [:create_drummer]

    test "deletes chosen drummer", %{conn: conn, drummer: drummer} do
      conn = delete(conn, ~p"/drummers/#{drummer}")
      assert redirected_to(conn) == ~p"/drummers"

      assert_error_sent 404, fn ->
        get(conn, ~p"/drummers/#{drummer}")
      end
    end
  end

  defp create_drummer(_) do
    drummer = drummer_fixture()
    %{drummer: drummer}
  end
end
