defmodule AtriaTask1.Utils do
  def get_topics_from_meta_deta(list_of_topics) do
    Enum.reduce(list_of_topics, [], fn topic, acc ->
      data = %{topic_name: topic.topic.topic_name, short_desc: topic.topic.short_desc}

      acc ++ [data]
    end)
  end
end
