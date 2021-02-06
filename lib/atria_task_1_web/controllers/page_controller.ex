defmodule AtriaTask1Web.PageController do
  use AtriaTask1Web, :controller

  def pre_populate_data(conn, _params) do
    AtriaTask1.Utils.add_topics_pre_populated()
    json(conn, %{status: true, message: "data_prepopulated_sucessfully"})
  end
end
