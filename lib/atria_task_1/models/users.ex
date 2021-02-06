defmodule AtriaTask1.Models.Users do
  import Ecto.Query, warn: false
  import Ecto.Changeset

  use Ecto.Schema

  alias Bcrypt
  alias AtriaTask1.Repo
  @primary_key {:user_id, :integer, autogenerate: false}

  @type t :: %__MODULE__{}
  schema "employees" do
    field(:full_name, :string)
    field(:email, :string)
    field(:password, :string)
    field(:age, :integer)
    timestamps()
  end

  @doc false
  def changeset(user, params \\ %{}) do
    user
    |> cast(params, [
      :user_id,
      :full_name,
      :email,
      :password,
      :age
    ])
    |> validate_required([
      :user_id,
      :full_name,
      :email,
      :password,
      :age
    ])
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> put_password_hash()
  end

  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    change(changeset, password: Bcrypt.hash_pwd_salt(password))
  end

  defp put_password_hash(changeset), do: changeset
end
