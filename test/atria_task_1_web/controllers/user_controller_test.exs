defmodule AtriaTask1Web.UserControllerTest do
  use AtriaTask1Web.ConnCase

  setup do
    conn =
      Phoenix.ConnTest.build_conn()
      |> put_req_header("content-type", "application/json")
      |> put_req_header("accept", "application/json")

    {:ok, conn: conn}
  end

  test "Signup Sucessfully", %{conn: conn} do
    user = %{
      email: "mahesh@test.in",
      full_name: "Mahesh Reddy",
      password: "123456",
      age: 26
    }

    conn = post(conn, Routes.user_path(conn, :signup, user))
    {:ok, result} = conn.resp_body |> Jason.decode(keys: :atoms)
    assert result.status == true
    assert result.message == "Mahesh Reddy signed up successfully."
  end

  test "Signup Failed", %{conn: conn} do
    user = %{
      email: "mahesh@test.in",
      full_name: "Mahesh Reddy",
      password: "123456",
      age: "26.25"
    }

    conn = post(conn, Routes.user_path(conn, :signup, user))
    {:ok, result} = conn.resp_body |> Jason.decode(keys: :atoms)
    assert result.status == false
  end
end
