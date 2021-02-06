defmodule AtriaTask1.Utils do
  def get_topics_from_meta_deta(list_of_topics) do
    Enum.reduce(list_of_topics, [], fn topic, acc ->
      data = %{topic_name: topic.topic.topic_name, short_desc: topic.topic.short_desc}

      acc ++ [data]
    end)
  end

  def add_topics_pre_populated() do
    sample_data =
      File.read!("priv/pre_populated_data/topic_sample.json")
      |> Jason.decode!()

    Enum.each(sample_data["data"], fn topic ->
      topic_details = %{
        topic_name: topic["topic_name"],
        short_desc: topic["short_desc"]
      }

      AtriaTask1.Models.TopicOfInterest.create_topic(topic_details)
    end)
  end
end
