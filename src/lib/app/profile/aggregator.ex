defmodule DatingApp.Profile.Aggregator do
  defstruct id: nil, name: nil, likes: MapSet.new(), dislikes: MapSet.new()

  alias DatingApp.Commands.OpenProfile
  alias DatingApp.Events.ProfileOpened

  def execute(%__MODULE__{ id: nil }, %OpenProfile{ id: id, name: name }) do
    %ProfileOpened{
      id: id,
      name: name,
      likes: [],
      dislikes: []
    }
  end

  def apply(%__MODULE__{} = profile, %ProfileOpened{ id: id, name: name, likes: likes, dislikes: dislikes }) do
    %__MODULE__{ profile |
      id: id,
      name: name,
      likes: MapSet.new(likes),
      dislikes: MapSet.new(dislikes)
    }
  end
end
