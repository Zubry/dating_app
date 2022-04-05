defmodule DatingAppWeb.MatchController do
  use DatingAppWeb, :controller

  alias DatingApp.User

  action_fallback DatingAppWeb.FallbackController

  def index(conn, %{ "id" => id }) do
    matches = User.list_matches(id)
    render(conn, "index.json", matches: matches)
  end
end
