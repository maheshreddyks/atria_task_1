defmodule AtriaTask1Web.PageController do
  use AtriaTask1Web, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
