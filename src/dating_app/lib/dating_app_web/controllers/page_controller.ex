defmodule DatingAppWeb.PageController do
  use DatingAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
