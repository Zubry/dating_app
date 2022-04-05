defmodule DatingApp.Profile.Router do
  use Commanded.Commands.Router

  alias DatingApp.Profile.Aggregator
  alias DatingApp.Commands.OpenProfile

  dispatch OpenProfile, to: Aggregator, identity: :id
end
