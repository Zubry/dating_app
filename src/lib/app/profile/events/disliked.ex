defmodule DatingApp.Profile.Events.Disliked do
  @derive Jason.Encoder
  defstruct id: nil, disliked_id: nil
end
