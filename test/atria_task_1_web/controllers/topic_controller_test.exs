defmodule AtriaTask1Web.TopicControllerTest do
  use AtriaTask1Web.ConnCase

  setup do
    conn =
      Phoenix.ConnTest.build_conn()
      |> put_req_header("content-type", "application/json")
      |> put_req_header("accept", "application/json")
      |> put_req_header("authorization", "Basic bWFoZXNoQHRlc3QuaW46MTIzNDU2")

    {:ok, conn: conn}
  end

  test "get_all_topics", %{conn: conn} do
    user = %{
      email: "mahesh@test.in",
      full_name: "Mahesh Reddy",
      password: "123456",
      age: 26
    }

    __conn_res_1 = post(conn, Routes.user_path(conn, :signup, user))
    _conn_res_2 = get(conn, Routes.page_path(conn, :pre_populate_data))
    conn = get(conn, Routes.topic_path(conn, :get_all_topics))
    {:ok, result} = conn.resp_body |> Jason.decode(keys: :atoms)
    assert result.status == true
  end

  test "add_topics_to_user successfull", %{conn: conn} do
    user = %{
      email: "mahesh@test.in",
      full_name: "Mahesh Reddy",
      password: "123456",
      age: 26
    }

    topic_names = %{"topic_names" => ["sports", "cars"]}
    _conn_res_1 = post(conn, Routes.user_path(conn, :signup, user))
    _conn_res_2 = get(conn, Routes.page_path(conn, :pre_populate_data))
    conn = post(conn, Routes.topic_path(conn, :add_topics_to_user, topic_names))
    {:ok, result} = conn.resp_body |> Jason.decode(keys: :atoms)
    assert result.status == true
  end

  test "add_topics_to_user Failed", %{conn: conn} do
    user = %{
      email: "mahesh@test.in",
      full_name: "Mahesh Reddy",
      password: "123456",
      age: 26
    }

    topic_names = %{"topic_names" => [31, 35, 9, 7, 3]}
    _conn_res_1 = post(conn, Routes.user_path(conn, :signup, user))
    _conn_res_2 = get(conn, Routes.page_path(conn, :pre_populate_data))
    conn = post(conn, Routes.topic_path(conn, :add_topics_to_user, topic_names))
    {:ok, result} = conn.resp_body |> Jason.decode(keys: :atoms)
    assert result.status == false
  end

  test "fetch_topic_of_user successfull", %{conn: conn} do
    user = %{
      email: "mahesh@test.in",
      full_name: "Mahesh Reddy",
      password: "123456",
      age: 26
    }

    topic_names = %{"topic_names" => ["sports", "cars"]}
    _conn_res_1 = post(conn, Routes.user_path(conn, :signup, user))
    _conn_res_2 = get(conn, Routes.page_path(conn, :pre_populate_data))
    _conn_res_3 = post(conn, Routes.topic_path(conn, :add_topics_to_user, topic_names))
    conn = get(conn, Routes.topic_path(conn, :get_user_topics, topic_names))
    {:ok, result} = conn.resp_body |> Jason.decode(keys: :atoms)
    assert result.status == true
  end
end
