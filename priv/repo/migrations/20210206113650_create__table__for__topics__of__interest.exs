defmodule AtriaTask1.Repo.Migrations.Create_Table_For_Topics_Of_Interest do
  use Ecto.Migration

  def change do
    create table(:topics_of_interest) do
      add(:topic_name, :string)
      add(:short_desc, :text)

      timestamps()
    end

    create unique_index(:topics_of_interest, [:topic_name])
  end
end
