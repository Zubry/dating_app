defmodule DatingApp.Messenger.Events.Messaged do
  @derive Jason.Encoder
  defstruct to: nil, from: nil, message: ""
end
