defmodule DatingApp.Messenger.Events.Messaged do
  @derive Jason.Encoder
  defstruct id: nil, room: nil, from: nil, message: ""
end
