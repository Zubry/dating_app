defmodule DatingApp.Messenger.Commands.CreateRoom do
  defstruct id: nil, participants: MapSet.new()
end
