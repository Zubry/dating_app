defmodule DatingApp.Messenger.Router do
  use Commanded.Commands.Router

  alias DatingApp.Messenger.Aggregate
  alias DatingApp.Messenger.Commands.{CreateRoom, Message}

  dispatch CreateRoom, to: Aggregate, identity: :id
  dispatch Message, to: Aggregate, identity: :room
end
