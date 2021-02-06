defmodule AtriaTask1Web.TopicController do
  use AtriaTask1Web, :controller
  alias AtriaTask1.Models.{TopicOfInterest, UserTopicLink}
  alias AtriaTask1.Utils
  # alias AtriaTask1Web.ChangesetView
  plug(AtriaTask1.Plug.Authenticate, [:get_all_topics, :add_topics_to_user, :get_user_topics])

  def get_all_topics(conn, _params) do
    all_topics = TopicOfInterest.get_all_topics()
    response = %{count: length(all_topics), topics: all_topics}
    json(conn, response)
  end

  def add_topics_to_user(conn, params) do
    current_user = conn.assigns[:current_user]

    if Map.has_key?(params, "topic_ids") && params["topic_ids"] != [] do
      all_topics_ids = TopicOfInterest.get_all_topics(:ids)
      current_list_ids = UserTopicLink.get_topics_for_user_id(current_user.user_id, :ids)
      params_list_ids = params["topic_ids"]
      extra_ids? = [] == params_list_ids -- all_topics_ids

      if extra_ids? do
        ids_to_add = params_list_ids -- current_list_ids

        Enum.each(ids_to_add, fn topic_id ->
          topic_details = %{
            user_id: current_user.user_id,
            topic_id: topic_id
          }

          UserTopicLink.create_user_topic_link(topic_details)
        end)

        response = %{status: true, message: "topic_ids added successfully"}
        json(conn, response)
      else
        response = %{status: false, message: "topic_ids entered unavailable"}

        conn
        |> put_status(422)
        |> json(response)
      end
    else
      response = %{status: false, message: "topic_ids unavailable"}

      conn
      |> put_status(422)
      |> json(response)
    end
  end

  def get_user_topics(conn, _params) do
    current_user = conn.assigns[:current_user]

    data =
      current_user.user_id
      |> UserTopicLink.get_topics_for_user_id(:preload)
      |> Utils.get_topics_from_meta_deta()

    response = %{count: length(data), topics: data}

    json(conn, response)
  end
end
