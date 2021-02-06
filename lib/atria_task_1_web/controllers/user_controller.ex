defmodule AtriaTask1Web.UserController do
  use AtriaTask1Web, :controller
  alias AtriaTask1.Models.Users
  alias AtriaTask1Web.ChangesetView

  def signup(conn, params) do
    case Users.create_user(params) do
      {:ok, changeset} ->
        response = ChangesetView.translate_ok(changeset, "User")

        json(conn, response)

      {:error, %Ecto.Changeset{} = changeset} ->
        response = ChangesetView.translate_errors(changeset)

        conn
        |> put_status(422)
        |> json(response)
    end
  end
end
