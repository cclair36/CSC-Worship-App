defmodule CscWorshipWeb.SubmitterAutocompleteControllerTest do
  use CscWorshipWeb.ConnCase

  import CscWorship.MusiciansFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  describe "index" do
    test "lists all submitter_autocomplete", %{conn: conn} do
      conn = get(conn, ~p"/submitter_autocomplete")
      assert html_response(conn, 200) =~ "Listing Submitter autocomplete"
    end
  end

  describe "new submitter_autocomplete" do
    test "renders form", %{conn: conn} do
      conn = get(conn, ~p"/submitter_autocomplete/new")
      assert html_response(conn, 200) =~ "New Submitter autocomplete"
    end
  end

  describe "create submitter_autocomplete" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, ~p"/submitter_autocomplete", submitter_autocomplete: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == ~p"/submitter_autocomplete/#{id}"

      conn = get(conn, ~p"/submitter_autocomplete/#{id}")
      assert html_response(conn, 200) =~ "Submitter autocomplete #{id}"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, ~p"/submitter_autocomplete", submitter_autocomplete: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Submitter autocomplete"
    end
  end

  describe "edit submitter_autocomplete" do
    setup [:create_submitter_autocomplete]

    test "renders form for editing chosen submitter_autocomplete", %{conn: conn, submitter_autocomplete: submitter_autocomplete} do
      conn = get(conn, ~p"/submitter_autocomplete/#{submitter_autocomplete}/edit")
      assert html_response(conn, 200) =~ "Edit Submitter autocomplete"
    end
  end

  describe "update submitter_autocomplete" do
    setup [:create_submitter_autocomplete]

    test "redirects when data is valid", %{conn: conn, submitter_autocomplete: submitter_autocomplete} do
      conn = put(conn, ~p"/submitter_autocomplete/#{submitter_autocomplete}", submitter_autocomplete: @update_attrs)
      assert redirected_to(conn) == ~p"/submitter_autocomplete/#{submitter_autocomplete}"

      conn = get(conn, ~p"/submitter_autocomplete/#{submitter_autocomplete}")
      assert html_response(conn, 200) =~ "some updated name"
    end

    test "renders errors when data is invalid", %{conn: conn, submitter_autocomplete: submitter_autocomplete} do
      conn = put(conn, ~p"/submitter_autocomplete/#{submitter_autocomplete}", submitter_autocomplete: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Submitter autocomplete"
    end
  end

  describe "delete submitter_autocomplete" do
    setup [:create_submitter_autocomplete]

    test "deletes chosen submitter_autocomplete", %{conn: conn, submitter_autocomplete: submitter_autocomplete} do
      conn = delete(conn, ~p"/submitter_autocomplete/#{submitter_autocomplete}")
      assert redirected_to(conn) == ~p"/submitter_autocomplete"

      assert_error_sent 404, fn ->
        get(conn, ~p"/submitter_autocomplete/#{submitter_autocomplete}")
      end
    end
  end

  defp create_submitter_autocomplete(_) do
    submitter_autocomplete = submitter_autocomplete_fixture()
    %{submitter_autocomplete: submitter_autocomplete}
  end
end
