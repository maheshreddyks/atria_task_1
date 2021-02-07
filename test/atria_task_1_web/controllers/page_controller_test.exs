defmodule AtriaTask1Web.PageControllerTest do
  use AtriaTask1Web.ConnCase

  setup do
    conn =
      Phoenix.ConnTest.build_conn()
      |> put_req_header("content-type", "application/json")
      |> put_req_header("accept", "application/json")

    {:ok, conn: conn}
  end

  test "prepopulate_all_topics", %{conn: conn} do
    conn = get(conn, Routes.page_path(conn, :pre_populate_data))
    {:ok, result} = conn.resp_body |> Jason.decode(keys: :atoms)
    assert result.status == true
    assert result.message == "data_prepopulated_sucessfully"
  end
end
