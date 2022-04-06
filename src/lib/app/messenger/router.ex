defmodule DatingApp.Messenger.Router do
  use Commanded.Commands.Router

  alias DatingApp.Messenger.Aggregate
  alias DatingApp.Messenger.Commands.{Message}

  dispatch Message, to: Aggregate, identity: :from
end
