defmodule DatingApp.Messenger do
  def message(from, to, message) do
    DatingApp.Commanded.Application.dispatch(%DatingApp.Messenger.Commands.Message{ from: from, to: to, message: message })
  end
end
