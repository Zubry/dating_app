defmodule DatingAppWeb.ProfileController do
  use DatingAppWeb, :controller

  alias DatingApp.User

  action_fallback DatingAppWeb.FallbackController

  def index(conn, _params) do
    profiles = User.list_profiles()
    render(conn, "index.json", profiles: profiles)
  end

  def create(conn, _params) do
    with id <- UUID.uuid4(),
         :ok <- User.create_profile(id) do
      conn
      |> put_status(:created)
      |> render("profile.json", profile: %{ id: id })
    end
  end
end
