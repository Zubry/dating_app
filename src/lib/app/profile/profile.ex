defmodule DatingApp.Profile do
  def open(id: id, name: name) do
    DatingApp.Profile.Application.dispatch(%DatingApp.Commands.OpenProfile{ id: id, name: name })
  end
end
