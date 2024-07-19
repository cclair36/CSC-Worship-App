defmodule CscWorshipWeb.BassistControllerTest do
  use CscWorshipWeb.ConnCase

  import CscWorship.MusiciansFixtures

  @create_attrs %{name: "some name", dates_unavailable: [], email: "some email", times_used: 42}
  @update_attrs %{name: "some updated name", dates_unavailable: [], email: "some updated email", times_used: 43}
  @invalid_attrs %{name: nil, dates_unavailable: nil, email: nil, times_used: nil}

  describe "index" do
    test "lists all bassists", %{conn: conn} do
      conn = get(conn, ~p"/bassists")
      assert html_response(conn, 200) =~ "Listing Bassists"
    end
  end

  describe "new bassist" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/bassists/new")
      assert html_response(conn, 200) =~ "New Bassist"
    end
  end

  describe "create bassist" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/bassists", bassist: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/bassists/#{id}"

      conn = get(conn, ~p"/bassists/#{id}")
      assert html_response(conn, 200) =~ "Bassist #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/bassists", bassist: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Bassist"
    end
  end

  describe "edit bassist" do
    setup [:create_bassist]

    test "renders form for editing chosen bassist", %{conn: conn, bassist: bassist} do
      conn = get(conn, ~p"/bassists/#{bassist}/edit")
      assert html_response(conn, 200) =~ "Edit Bassist"
    end
  end

  describe "update bassist" do
    setup [:create_bassist]

    test "redirects when data is valid", %{conn: conn, bassist: bassist} do
      conn = put(conn, ~p"/bassists/#{bassist}", bassist: @update_attrs)
      assert redirected_to(conn) == ~p"/bassists/#{bassist}"

      conn = get(conn, ~p"/bassists/#{bassist}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, bassist: bassist} do
      conn = put(conn, ~p"/bassists/#{bassist}", bassist: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Bassist"
    end
  end

  describe "delete bassist" do
    setup [:create_bassist]

    test "deletes chosen bassist", %{conn: conn, bassist: bassist} do
      conn = delete(conn, ~p"/bassists/#{bassist}")
      assert redirected_to(conn) == ~p"/bassists"

      assert_error_sent 404, fn ->
        get(conn, ~p"/bassists/#{bassist}")
      end
    end
  end

  defp create_bassist(_) do
    bassist = bassist_fixture()
    %{bassist: bassist}
  end
end
