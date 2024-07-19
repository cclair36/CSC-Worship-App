defmodule CscWorshipWeb.SlideControllerTest do
  use CscWorshipWeb.ConnCase

  import CscWorship.MusiciansFixtures

  @create_attrs %{name: "some name", dates_avaliable: [], email: "some email"}
  @update_attrs %{name: "some updated name", dates_avaliable: [], email: "some updated email"}
  @invalid_attrs %{name: nil, dates_avaliable: nil, email: nil}

  describe "index" do
    test "lists all slides", %{conn: conn} do
      conn = get(conn, ~p"/slides")
      assert html_response(conn, 200) =~ "Listing Slides"
    end
  end

  describe "new slide" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/slides/new")
      assert html_response(conn, 200) =~ "New Slide"
    end
  end

  describe "create slide" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/slides", slide: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/slides/#{id}"

      conn = get(conn, ~p"/slides/#{id}")
      assert html_response(conn, 200) =~ "Slide #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/slides", slide: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Slide"
    end
  end

  describe "edit slide" do
    setup [:create_slide]

    test "renders form for editing chosen slide", %{conn: conn, slide: slide} do
      conn = get(conn, ~p"/slides/#{slide}/edit")
      assert html_response(conn, 200) =~ "Edit Slide"
    end
  end

  describe "update slide" do
    setup [:create_slide]

    test "redirects when data is valid", %{conn: conn, slide: slide} do
      conn = put(conn, ~p"/slides/#{slide}", slide: @update_attrs)
      assert redirected_to(conn) == ~p"/slides/#{slide}"

      conn = get(conn, ~p"/slides/#{slide}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, slide: slide} do
      conn = put(conn, ~p"/slides/#{slide}", slide: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Slide"
    end
  end

  describe "delete slide" do
    setup [:create_slide]

    test "deletes chosen slide", %{conn: conn, slide: slide} do
      conn = delete(conn, ~p"/slides/#{slide}")
      assert redirected_to(conn) == ~p"/slides"

      assert_error_sent 404, fn ->
        get(conn, ~p"/slides/#{slide}")
      end
    end
  end

  defp create_slide(_) do
    slide = slide_fixture()
    %{slide: slide}
  end
end
