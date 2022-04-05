defmodule DatingApp.Profile.Events.Liked do
  @derive Jason.Encoder
  defstruct id: nil, liked_id: nil
end
