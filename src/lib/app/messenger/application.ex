defmodule DatingApp.Messenger.Application do
  use Commanded.Application, otp_app: :app, event_store: [adapter: Commanded.EventStore.Adapters.InMemory]

  router DatingApp.Messenger.Router
end
