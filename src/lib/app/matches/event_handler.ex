defmodule DatingApp.Matches.EventHandler do
  use Commanded.Event.Handler, application: DatingApp.Commanded.Application, start_from: :origin, name: __MODULE__

  alias DatingApp.Profile.Events.{Opened, Liked}
  alias DatingApp.Messenger.Events.{Messaged}

  def handle(%Opened{ id: id }, _metadata) do
    DatingApp.Matches.open(id)

    :ok
  end

  def handle(%Liked{ id: id, liked_id: liked_id }, _metadata) do
    DatingApp.Matches.like(id, liked_id)

    :ok
  end

  def handle(%Messaged{ from: from, to: to, message: message }, _metadata) do
    DatingApp.Matches.add_message(from, from, to, message)
    DatingApp.Matches.add_message(to, from, to, message)

    :ok
  end

  def handle(_, _) do
    :ok
  end
end
