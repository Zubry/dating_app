defmodule DatingApp.Profile do
  def open(id) do
    DatingApp.Commanded.Application.dispatch(%DatingApp.Profile.Commands.Open{ id: id })
  end

  def like(id, liked_id) do
    DatingApp.Commanded.Application.dispatch(%DatingApp.Profile.Commands.Like{ id: id, liked_id: liked_id })
  end

  def dislike(id, disliked_id) do
    DatingApp.Commanded.Application.dispatch(%DatingApp.Profile.Commands.Dislike{ id: id, disliked_id: disliked_id })
  end
end
