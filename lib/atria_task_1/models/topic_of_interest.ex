defmodule AtriaTask1.Models.TopicOfInterest do
  import Ecto.Query, warn: false
  import Ecto.Changeset

  use Ecto.Schema

  alias AtriaTask1.Repo

  @type t :: %__MODULE__{}
  schema "topics_of_interest" do
    field(:topic_name, :string)
    field(:short_desc, :string)

    timestamps()
  end

  @doc false
  def changeset(topic_details, params \\ %{}) do
    topic_details
    |> cast(params, [
      :topic_name,
      :short_desc
    ])
    |> validate_required([
      :topic_name,
      :short_desc
    ])
    |> unique_constraint(:topic_name)
  end

  @doc """

  #### Input

  ```elixir
  topic_details = %{
      topic_name: "sports",
      short_desc: "Sport includes all forms of competitive physical activity or games which,[1] through casual or organized participation, at least in part aim to use, maintain or improve physical ability and skills while providing enjoyment to participants, and in some cases, entertainment for spectators.[2] Sports can bring positive results to one's physical health. Hundreds of sports exist, from those between single contestants, through to those with hundreds of simultaneous participants, either in teams or competing as individuals. In certain sports such as racing, many contestants may compete, simultaneously or consecutively, with one winner; in others, the contest (a match) is between two sides, each attempting to exceed the other. Some sports allow a tie or draw, in which there is no single winner; others provide tie-breaking methods to ensure one winner and one loser. A number of contests may be arranged in a tournament producing a champion. Many sports leagues make an annual champion by arranging games in a regular sports season, followed in some cases by playoffs."
    }

  AtriaTask1.Models.TopicOfInterest.create_topic(topic_details)
  ```
  #### Output

  ```elixir
  {:ok,
   %AtriaTask1.Models.TopicOfInterest{
     __meta__: #Ecto.Schema.Metadata<:loaded, "topics_of_interest">,
     topic_name: "sports",
     short_desc: "Sport includes all forms of competitive physical activity or games which,[1] through casual or organized participation, at least in part aim to use, maintain or improve physical ability and skills while providing enjoyment to participants, and in some cases, entertainment for spectators.[2] Sports can bring positive results to one's physical health. Hundreds of sports exist, from those between single contestants, through to those with hundreds of simultaneous participants, either in teams or competing as individuals. In certain sports such as racing, many contestants may compete, simultaneously or consecutively, with one winner; in others, the contest (a match) is between two sides, each attempting to exceed the other. Some sports allow a tie or draw, in which there is no single winner; others provide tie-breaking methods to ensure one winner and one loser. A number of contests may be arranged in a tournament producing a champion. Many sports leagues make an annual champion by arranging games in a regular sports season, followed in some cases by playoffs."
   }}

  ```
  """
  @spec create_topic(map) :: map
  def create_topic(attrs \\ %{}) do
    %__MODULE__{}
    |> changeset(attrs)
    |> Repo.insert()
  end

  def get_all_topics(type \\ :default) do
    case type do
      :ids ->
        from(toi in AtriaTask1.Models.TopicOfInterest,
          select: toi.id
        )
        |> Repo.all()

      _ ->
        from(toi in AtriaTask1.Models.TopicOfInterest,
          select: %{topic_name: toi.topic_name, short_desc: toi.short_desc, id: toi.id}
        )
        |> Repo.all()
    end
  end
end
