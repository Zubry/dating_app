defmodule DatingApp.Messenger do
  def create_room(id, participants) do
    DatingApp.Messenger.Application.dispatch(%DatingApp.Messenger.Commands.CreateRoom{ id: id, participants: participants })
  end

  def message(id, room, from, message) do
    DatingApp.Messenger.Application.dispatch(%DatingApp.Messenger.Commands.Message{ id: id, from: from, room: room, message: message })
  end
end
