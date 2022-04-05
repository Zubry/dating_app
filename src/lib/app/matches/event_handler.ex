defmodule DatingApp.Matches.EventHandler do
  use Commanded.Event.Handler, application: DatingApp.Profile.Application, start_from: :origin, name: __MODULE__

  alias DatingApp.Profile.Events.{Opened, Liked}

  def handle(%Opened{ id: id }, _metadata) do
    DatingApp.Matches.open(id)

    :ok
  end

  def handle(%Liked{ id: id, liked_id: liked_id }, _metadata) do
    DatingApp.Matches.like(id, liked_id)

    :ok
  end

  def handle(event, metadata) do
    IO.inspect({event, metadata})

    :ok
  end
end
