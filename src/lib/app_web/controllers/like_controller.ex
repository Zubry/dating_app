defmodule DatingAppWeb.LikeController do
  use DatingAppWeb, :controller

  alias DatingApp.User

  action_fallback DatingAppWeb.FallbackController

  def create(conn, %{ "profile_id" => id, "id" => liked_id }) do
    with :ok <- User.create_like(%{ id: id, liked_id: liked_id }) do
      conn
      |> put_status(:created)
      |> render("show.json", %{})
    end
  end
end
