defmodule DatingApp.Messenger.Aggregate do
  defstruct []

  alias DatingApp.Messenger.Commands.{Message}
  alias DatingApp.Messenger.Events.{Messaged}

  def execute(_state, %Message{ from: from, to: to, message: message }) do
    if DatingApp.Matches.matched?(from, to) do
      %Messaged{ from: from, to: to, message: message }
    else
      {:error, :not_matched}
    end
  end

  # When a message is processed, we do not need to maintain any state
  def apply(%__MODULE__{} = room, _) do
    room
  end
end
