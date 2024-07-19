defmodule CscWorshipWeb.ElectricControllerTest do
  use CscWorshipWeb.ConnCase

  import CscWorship.MusiciansFixtures

  @create_attrs %{name: "some name", dates_avaliable: [], email: "some email"}
  @update_attrs %{name: "some updated name", dates_avaliable: [], email: "some updated email"}
  @invalid_attrs %{name: nil, dates_avaliable: nil, email: nil}

  describe "index" do
    test "lists all el_guitar", %{conn: conn} do
      conn = get(conn, ~p"/el_guitar")
      assert html_response(conn, 200) =~ "Listing El guitar"
    end
  end

  describe "new electric" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/el_guitar/new")
      assert html_response(conn, 200) =~ "New Electric"
    end
  end

  describe "create electric" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/el_guitar", electric: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/el_guitar/#{id}"

      conn = get(conn, ~p"/el_guitar/#{id}")
      assert html_response(conn, 200) =~ "Electric #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/el_guitar", electric: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Electric"
    end
  end

  describe "edit electric" do
    setup [:create_electric]

    test "renders form for editing chosen electric", %{conn: conn, electric: electric} do
      conn = get(conn, ~p"/el_guitar/#{electric}/edit")
      assert html_response(conn, 200) =~ "Edit Electric"
    end
  end

  describe "update electric" do
    setup [:create_electric]

    test "redirects when data is valid", %{conn: conn, electric: electric} do
      conn = put(conn, ~p"/el_guitar/#{electric}", electric: @update_attrs)
      assert redirected_to(conn) == ~p"/el_guitar/#{electric}"

      conn = get(conn, ~p"/el_guitar/#{electric}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, electric: electric} do
      conn = put(conn, ~p"/el_guitar/#{electric}", electric: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Electric"
    end
  end

  describe "delete electric" do
    setup [:create_electric]

    test "deletes chosen electric", %{conn: conn, electric: electric} do
      conn = delete(conn, ~p"/el_guitar/#{electric}")
      assert redirected_to(conn) == ~p"/el_guitar"

      assert_error_sent 404, fn ->
        get(conn, ~p"/el_guitar/#{electric}")
      end
    end
  end

  defp create_electric(_) do
    electric = electric_fixture()
    %{electric: electric}
  end
end
