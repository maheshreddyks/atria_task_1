defmodule AtriaTask1.Repo.Migrations.Create_Table_For_Users do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add(:user_id, :integer, primary_key: true)
      add(:full_name, :string)
      add(:email, :string)
      add(:password, :string)
      add(:age, :integer)

      timestamps()
    end

    create(index("users", [:user_id, :password]))
    create(index("users", [:user_id, :full_name, :email, :age]))
  end
end
