defmodule AtriaTask1Web.TopicController do
  use AtriaTask1Web, :controller
  alias AtriaTask1.Models.Users
  alias AtriaTask1Web.ChangesetView
  plug(AtriaTask1.Plug.Authenticate, [:get_all_topics])

  def get_all_topics(conn, _params) do
    current_user = conn.assigns[:current_user]
    # case Users.create_user(params) do
    #   {:ok, changeset} ->
    #     response = ChangesetView.translate_ok(changeset, "User")
    #
    #     json(conn, response)
    #
    #   {:error, %Ecto.Changeset{} = changeset} ->
    #     response = ChangesetView.translate_errors(changeset)
    #
    #     conn
    #     |> put_status(422)
    #     |> json(response)
    # end
  end
end
