defmodule AtriaTask1.Models.UserTopicLink do
  import Ecto.Query, warn: false
  import Ecto.Changeset

  use Ecto.Schema

  alias AtriaTask1.Repo
  alias AtriaTask1.Models.{TopicOfInterest, Users}

  @type t :: %__MODULE__{}
  schema "user_topic_link" do
    belongs_to(:user, Users, references: :user_id)
    belongs_to(:topic, TopicOfInterest, references: :id)

    timestamps()
  end

  @doc false
  def changeset(topic_details, params \\ %{}) do
    topic_details
    |> cast(params, [
      :user_id,
      :topic_id
    ])
    |> validate_required([
      :user_id,
      :topic_id
    ])
  end

  @doc """

  #### Input

  ```elixir
  topic_details = %{
      user_id: 1,
      topic_id: 1
     }

  AtriaTask1.Models.UserTopicLink.create_user_topic_link(topic_details)
  ```
  #### Output

  ```elixir
  {:ok,
   %AtriaTask1.Models.UserTopicLink{
     __meta__: #Ecto.Schema.Metadata<:loaded, "user_topic_link">,
     id: 1,
     inserted_at: ~N[2021-02-06 16:26:44],
     topic: #Ecto.Association.NotLoaded<association :topic is not loaded>,
     topic_id: 1,
     updated_at: ~N[2021-02-06 16:26:44],
     user: #Ecto.Association.NotLoaded<association :user is not loaded>,
     user_id: 1
   }}


  ```
  """
  @spec create_user_topic_link(map) :: map
  def create_user_topic_link(attrs \\ %{}) do
    %__MODULE__{}
    |> changeset(attrs)
    |> Repo.insert()
  end

  @doc """

  #### Input

  ```elixir
  user_details = 1
  AtriaTask1.Models.UserTopicLink.get_topics_for_user_id(user_details,:preload)
  ```
  #### Output

  ```elixir
  [
    %AtriaTask1.Models.UserTopicLink{
      __meta__: #Ecto.Schema.Metadata<:loaded, "user_topic_link">,
      id: 1,
      inserted_at: ~N[2021-02-06 16:26:44],
      topic: %AtriaTask1.Models.TopicOfInterest{
        __meta__: #Ecto.Schema.Metadata<:loaded, "topics_of_interest">,
        id: 1,
        inserted_at: ~N[2021-02-06 15:42:54],
        short_desc: "Sport includes all forms of competitive physical activity or games which,[1] through casual or organized participation, at least in part aim to use, maintain or improve physical ability and skills while providing enjoyment to participants, and in some cases, entertainment for spectators.[2] Sports can bring positive results to one's physical health. Hundreds of sports exist, from those between single contestants, through to those with hundreds of simultaneous participants, either in teams or competing as individuals. In certain sports such as racing, many contestants may compete, simultaneously or consecutively, with one winner; in others, the contest (a match) is between two sides, each attempting to exceed the other. Some sports allow a tie or draw, in which there is no single winner; others provide tie-breaking methods to ensure one winner and one loser. A number of contests may be arranged in a tournament producing a champion. Many sports leagues make an annual champion by arranging games in a regular sports season, followed in some cases by playoffs.",
        topic_name: "sports",
        updated_at: ~N[2021-02-06 15:42:54]
      },
      topic_id: 1,
      updated_at: ~N[2021-02-06 16:26:44],
      user: #Ecto.Association.NotLoaded<association :user is not loaded>,
      user_id: 1
    }
  ]

  ```
  """
  def get_topics_for_user_id(user_id, type) do
    case type do
      :preload ->
        from(toi in AtriaTask1.Models.UserTopicLink,
          where: toi.user_id == ^user_id,
          preload: [:topic]
        )
        |> Repo.all()

      :topic_names ->
        from(toi in AtriaTask1.Models.UserTopicLink,
          where: toi.user_id == ^user_id,
          # select: toi.topic_id,
          preload: [:topic]
        )
        |> Repo.all()
        |> Enum.map(fn topic -> topic.topic.topic_name end)
    end
  end
end
