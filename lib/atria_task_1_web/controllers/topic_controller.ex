defmodule AtriaTask1Web.TopicController do
  use AtriaTask1Web, :controller
  alias AtriaTask1.Models.{TopicOfInterest, UserTopicLink}
  alias AtriaTask1.Utils
  # alias AtriaTask1Web.ChangesetView
  plug(AtriaTask1.Plug.Authenticate, [:get_all_topics, :add_topics_to_user, :get_user_topics])

  def get_all_topics(conn, _params) do
    all_topics = TopicOfInterest.get_all_topics()
    response = %{status: true, count: length(all_topics), topics: all_topics}
    json(conn, response)
  end

  def add_topics_to_user(conn, params) do
    current_user = conn.assigns[:current_user]

    if Map.has_key?(params, "topic_names") && params["topic_names"] != [] do
      all_topics = TopicOfInterest.get_all_topics(:topic_name)

      all_topics_names = all_topics |> Enum.map(fn topic -> topic.topic_name end)

      current_list = UserTopicLink.get_topics_for_user_id(current_user.user_id, :topic_names)
      params_list = params["topic_names"]
      extra_ids? = [] == params_list -- all_topics_names
      ids_to_add = params_list -- current_list

      if extra_ids? && ids_to_add != [] do
        Enum.each(ids_to_add, fn topic_id ->
          topic_details = Enum.find(all_topics, fn topic -> topic.topic_name == topic_id end)

          topic_details = %{
            user_id: current_user.user_id,
            topic_id: topic_details.id
          }

          UserTopicLink.create_user_topic_link(topic_details)
        end)

        response = %{status: true, message: "topic_names added successfully"}
        json(conn, response)
      else
        response = %{
          status: false,
          message: "some topic_names entered are unavailable or already alloted"
        }

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

    response = %{status: true, count: length(data), topics: data}

    json(conn, response)
  end
end
