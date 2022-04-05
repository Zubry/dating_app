defmodule DatingApp.Profile.Router do
  use Commanded.Commands.Router

  alias DatingApp.Profile.Aggregate
  alias DatingApp.Profile.Commands.{Open, Like, Dislike}

  identify Aggregate, by: :id
  dispatch [Open, Like, Dislike], to: Aggregate
end
