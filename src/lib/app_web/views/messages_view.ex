defmodule DatingAppWeb.MessagesView do
  use DatingAppWeb, :view
  alias DatingAppWeb.MessagesView

  def render("index.json", %{messages: messages}) do
    %{data: render_many(messages, MessagesView, "messages.json")}
  end

  def render("show.json", %{messages: messages}) do
    %{data: render_one(messages, MessagesView, "messages.json")}
  end

  def render("messages.json", %{messages: messages}) do
    messages
  end
end
