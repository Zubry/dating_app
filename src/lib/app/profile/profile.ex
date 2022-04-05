defmodule DatingApp.Profile do
  def open(id) do
    DatingApp.Profile.Application.dispatch(%DatingApp.Commands.OpenProfile{ id: id })
  end

  def like(id, liked_id) do
    DatingApp.Profile.Application.dispatch(%DatingApp.Commands.Like{ id: id, liked_id: liked_id })
  end

  def dislike(id, disliked_id) do
    DatingApp.Profile.Application.dispatch(%DatingApp.Commands.Dislike{ id: id, disliked_id: disliked_id })
  end
end
