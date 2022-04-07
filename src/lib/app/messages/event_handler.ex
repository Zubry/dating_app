defmodule DatingApp.Messages.EventHandler do
  use Commanded.Event.Handler, application: DatingApp.Commanded.Application, start_from: :origin, name: __MODULE__

  alias DatingApp.Profile.Events.{Opened}
  alias DatingApp.Messenger.Events.{Messaged}

  def handle(%Opened{ id: id }, _metadata) do
    DatingApp.Messages.open(id)

    :ok
  end

  def handle(%Messaged{ from: from, to: to, message: message }, _metadata) do
    DatingApp.Messages.add_message(from, from, to, message)
    DatingApp.Messages.add_message(to, from, to, message)

    :ok
  end

  def handle(_, _) do
    :ok
  end
end