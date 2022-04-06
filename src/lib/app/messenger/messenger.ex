defmodule DatingApp.Messenger do
  def message(id, from, to, message) do
    DatingApp.Commanded.Application.dispatch(%DatingApp.Messenger.Commands.Message{ id: id, from: from, to: to, message: message })
  end
end
