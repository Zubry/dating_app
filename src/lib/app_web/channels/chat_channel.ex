defmodule DatingAppWeb.ChatChannel do
  use DatingAppWeb, :channel

  @impl true
  def join("chat:" <> id, _payload, socket) do
    Phoenix.PubSub.subscribe(DatingApp.PubSub, "user:" <> id)

    send(self(), {:after_join, id})

    {:ok, socket}
  end

  @impl true
  def handle_info({:after_join, id}, socket) do
    messages = DatingApp.User.get_messages!(id).messages
    push(socket, "messages:initial", messages)
    {:noreply, socket}
  end

  def handle_info({:message, from, message}, socket) do
    push(socket, "message", %{ from: from, message: message })
    {:noreply, socket}
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  @impl true
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (chat:lobby).
  @impl true
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
