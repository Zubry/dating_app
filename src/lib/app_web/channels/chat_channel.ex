defmodule DatingAppWeb.ChatChannel do
  use DatingAppWeb, :channel

  @impl true
  def join("chat:" <> id, _payload, socket) do
    Phoenix.PubSub.subscribe(DatingApp.PubSub, "user:" <> id)

    send(self(), {:after_join, id})

    {:ok, assign(socket, :id, id)}
  end

  @impl true
  def handle_info({:after_join, id}, socket) do
    messages = DatingApp.User.get_messages!(id).messages
    push(socket, "messages:initial", messages)
    {:noreply, socket}
  end

  def handle_info({:message, to, from, message}, socket) do
    push(socket, "message", %{ to: to, from: from, message: message })
    {:noreply, socket}
  end

  @impl true
  def handle_in("message", %{ "to" => to, "message" => message }, socket) do
    DatingApp.User.create_message(socket.assigns.id, to, message)
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
