defmodule DatingAppWeb.MessagesController do
  use DatingAppWeb, :controller

  alias DatingApp.User
  alias DatingApp.User.Messages

  action_fallback DatingAppWeb.FallbackController

  def show(conn, %{"id" => id}) do
    messages = User.get_messages!(id)
    render(conn, "show.json", messages: messages)
  end
end
