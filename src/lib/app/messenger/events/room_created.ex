defmodule DatingApp.Messenger.Events.RoomCreated do
  @derive Jason.Encoder
  defstruct id: nil, participants: []
end
