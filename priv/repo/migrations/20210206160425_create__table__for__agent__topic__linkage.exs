defmodule AtriaTask1.Repo.Migrations.Create_Table_For_Agent_Topic_Linkage do
  use Ecto.Migration

  def change do
    create table(:user_topic_link) do
      add(:topic_id, :integer)
      add(:user_id, :integer)

      timestamps()
    end
  end
end
