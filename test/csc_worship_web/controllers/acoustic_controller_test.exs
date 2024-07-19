defmodule CscWorshipWeb.AcousticControllerTest do
  use CscWorshipWeb.ConnCase

  import CscWorship.MusiciansFixtures

  @create_attrs %{name: "some name", dates_avaliable: [], email: "some email"}
  @update_attrs %{name: "some updated name", dates_avaliable: [], email: "some updated email"}
  @invalid_attrs %{name: nil, dates_avaliable: nil, email: nil}

  describe "index" do
    test "lists all ac_guitar", %{conn: conn} do
      conn = get(conn, ~p"/ac_guitar")
      assert html_response(conn, 200) =~ "Listing Ac guitar"
    end
  end

  describe "new acoustic" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/ac_guitar/new")
      assert html_response(conn, 200) =~ "New Acoustic"
    end
  end

  describe "create acoustic" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/ac_guitar", acoustic: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/ac_guitar/#{id}"

      conn = get(conn, ~p"/ac_guitar/#{id}")
      assert html_response(conn, 200) =~ "Acoustic #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/ac_guitar", acoustic: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Acoustic"
    end
  end

  describe "edit acoustic" do
    setup [:create_acoustic]

    test "renders form for editing chosen acoustic", %{conn: conn, acoustic: acoustic} do
      conn = get(conn, ~p"/ac_guitar/#{acoustic}/edit")
      assert html_response(conn, 200) =~ "Edit Acoustic"
    end
  end

  describe "update acoustic" do
    setup [:create_acoustic]

    test "redirects when data is valid", %{conn: conn, acoustic: acoustic} do
      conn = put(conn, ~p"/ac_guitar/#{acoustic}", acoustic: @update_attrs)
      assert redirected_to(conn) == ~p"/ac_guitar/#{acoustic}"

      conn = get(conn, ~p"/ac_guitar/#{acoustic}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, acoustic: acoustic} do
      conn = put(conn, ~p"/ac_guitar/#{acoustic}", acoustic: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Acoustic"
    end
  end

  describe "delete acoustic" do
    setup [:create_acoustic]

    test "deletes chosen acoustic", %{conn: conn, acoustic: acoustic} do
      conn = delete(conn, ~p"/ac_guitar/#{acoustic}")
      assert redirected_to(conn) == ~p"/ac_guitar"

      assert_error_sent 404, fn ->
        get(conn, ~p"/ac_guitar/#{acoustic}")
      end
    end
  end

  defp create_acoustic(_) do
    acoustic = acoustic_fixture()
    %{acoustic: acoustic}
  end
end
