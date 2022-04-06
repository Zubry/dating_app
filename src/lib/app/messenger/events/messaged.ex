defmodule DatingApp.Messenger.Events.Messaged do
  @derive Jason.Encoder
  defstruct id: nil, to: nil, from: nil, message: ""
end
