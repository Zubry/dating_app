defmodule DatingApp.Messenger.Aggregate do
  defstruct id: nil, participants: MapSet.new()

  alias DatingApp.Messenger.Commands.{CreateRoom, Message}
  alias DatingApp.Messenger.Events.{RoomCreated, Messaged}

  def execute(%__MODULE__{ id: nil }, %CreateRoom{ id: id, participants: participants }) do
    %RoomCreated{ id: id, participants: participants }
  end

  def execute(%__MODULE__{ id: nil }, %Message{}) do
    {:error, :does_not_exist}
  end

  def execute(%__MODULE__{ participants: participants }, %Message{ id: id, from: from, room: room, message: message }) do
    if MapSet.member?(participants, from) do
      %Messaged{ id: id, from: from, room: room, message: message }
    else
      {:error, :not_in_room}
    end
  end

  def apply(%__MODULE__{} = room, %RoomCreated{ id: id, participants: participants }) do
    %__MODULE__{ room | id: id, participants: participants }
  end

  # When a message is processed, we do not need to maintain any state
  def apply(%__MODULE__{} = room, _) do
    room
  end
end
