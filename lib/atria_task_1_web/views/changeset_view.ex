defmodule AtriaTask1Web.ChangesetView do
  use AtriaTask1Web, :view

  def translate_errors(changeset) do
    %{errors: Ecto.Changeset.traverse_errors(changeset, &translate_error/1), status: false}
  end

  def translate_ok(changeset, "User") do
    %{message: "#{changeset.full_name} signed up successfully.", status: true}
  end

  def render("error.json", %{changeset: changeset}) do
    # When encoded, the changeset returns its errors
    # as a JSON object. So we just pass it forward.
    %{errors: translate_errors(changeset)}
  end
end
