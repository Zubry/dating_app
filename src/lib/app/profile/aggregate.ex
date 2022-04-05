defmodule DatingApp.Profile.Aggregate do
  defstruct id: nil, name: nil, likes: MapSet.new(), dislikes: MapSet.new()

  alias DatingApp.Commands.{OpenProfile, Like, Dislike}
  alias DatingApp.Events.{ProfileOpened, Liked, Disliked}

  def execute(%__MODULE__{ id: nil }, %OpenProfile{ id: id }) do
    %ProfileOpened{ id: id }
  end

  def execute(%__MODULE__{ id: nil }, %Like{}) do
    {:error, :not_opened}
  end

  def execute(%__MODULE__{ id: id, likes: likes, dislikes: dislikes }, %Like{ id: id, liked_id: liked_id }) do
    cond do
      id == liked_id ->
        {:error, :cannot_like_self}
      # If the user has already liked the given profile
      MapSet.member?(likes, liked_id) ->
        {:error, :already_liked}
      # If the user has already disliked the given profile
      MapSet.member?(dislikes, liked_id) ->
        {:error, :already_disliked}
      true ->
        %Liked{ id: id, liked_id: liked_id }
    end
  end

  def execute(%__MODULE__{ id: nil }, %Dislike{}) do
    {:error, :not_opened}
  end

  def execute(%__MODULE__{ id: id, likes: likes, dislikes: dislikes }, %Dislike{ id: id, disliked_id: disliked_id }) do
    cond do
      id == disliked_id ->
        {:error, :cannot_dislike_self}
      # If the user has already liked the given profile
      MapSet.member?(likes, disliked_id) ->
        {:error, :already_liked}
      # If the user has already disliked the given profile
      MapSet.member?(dislikes, disliked_id) ->
        {:error, :already_disliked}
      true ->
        %Disliked{ id: id, disliked_id: disliked_id }
    end
  end

  def apply(%__MODULE__{} = profile, %ProfileOpened{ id: id }) do
    %__MODULE__{ profile | id: id }
  end

  def apply(%__MODULE__{} = profile, %Liked{ liked_id: liked_id }) do
    update_in(profile.likes, fn likes -> MapSet.put(likes, liked_id) end)
  end

  def apply(%__MODULE__{} = profile, %Disliked{ disliked_id: disliked_id }) do
    update_in(profile.dislikes, fn dislikes -> MapSet.put(dislikes, disliked_id) end)
  end
end
