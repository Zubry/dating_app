defmodule DatingApp.Events.ProfileOpened do
  @derive Jason.Encoder
  defstruct id: nil, name: nil, likes: [], dislikes: []
end
