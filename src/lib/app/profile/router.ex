defmodule DatingApp.Profile.Router do
  use Commanded.Commands.Router

  alias DatingApp.Profile.Aggregate
  alias DatingApp.Commands.{OpenProfile, Like, Dislike}

  identify Aggregate, by: :id
  dispatch [OpenProfile, Like, Dislike], to: Aggregate
end
