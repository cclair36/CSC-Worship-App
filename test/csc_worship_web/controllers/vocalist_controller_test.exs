defmodule CscWorshipWeb.VocalistControllerTest do
  use CscWorshipWeb.ConnCase

  import CscWorship.MusiciansFixtures

  @create_attrs %{name: "some name", dates_avaliable: [], email: "some email"}
  @update_attrs %{name: "some updated name", dates_avaliable: [], email: "some updated email"}
  @invalid_attrs %{name: nil, dates_avaliable: nil, email: nil}

  describe "index" do
    test "lists all vocalists", %{conn: conn} do
      conn = get(conn, ~p"/vocalists")
      assert html_response(conn, 200) =~ "Listing Vocalists"
    end
  end

  describe "new vocalist" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/vocalists/new")
      assert html_response(conn, 200) =~ "New Vocalist"
    end
  end

  describe "create vocalist" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/vocalists", vocalist: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/vocalists/#{id}"

      conn = get(conn, ~p"/vocalists/#{id}")
      assert html_response(conn, 200) =~ "Vocalist #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/vocalists", vocalist: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Vocalist"
    end
  end

  describe "edit vocalist" do
    setup [:create_vocalist]

    test "renders form for editing chosen vocalist", %{conn: conn, vocalist: vocalist} do
      conn = get(conn, ~p"/vocalists/#{vocalist}/edit")
      assert html_response(conn, 200) =~ "Edit Vocalist"
    end
  end

  describe "update vocalist" do
    setup [:create_vocalist]

    test "redirects when data is valid", %{conn: conn, vocalist: vocalist} do
      conn = put(conn, ~p"/vocalists/#{vocalist}", vocalist: @update_attrs)
      assert redirected_to(conn) == ~p"/vocalists/#{vocalist}"

      conn = get(conn, ~p"/vocalists/#{vocalist}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, vocalist: vocalist} do
      conn = put(conn, ~p"/vocalists/#{vocalist}", vocalist: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Vocalist"
    end
  end

  describe "delete vocalist" do
    setup [:create_vocalist]

    test "deletes chosen vocalist", %{conn: conn, vocalist: vocalist} do
      conn = delete(conn, ~p"/vocalists/#{vocalist}")
      assert redirected_to(conn) == ~p"/vocalists"

      assert_error_sent 404, fn ->
        get(conn, ~p"/vocalists/#{vocalist}")
      end
    end
  end

  defp create_vocalist(_) do
    vocalist = vocalist_fixture()
    %{vocalist: vocalist}
  end
end
