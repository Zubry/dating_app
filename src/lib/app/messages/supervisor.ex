defmodule DatingApp.Messages.Supervisor do
  # Automatically defines child_spec/1
  use Supervisor

  def start_link(init_arg) do
    Supervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  @impl true
  def init(_init_arg) do
    children = [
      {DatingApp.Messages.EventHandler, []},
      {Registry, keys: :unique, name: DatingApp.Messages.Registry},
      {DynamicSupervisor, strategy: :one_for_one, name: DatingApp.Messages.DynamicSupervisor}
    ]

    # If the event handle crashes, we need to restart everything
    Supervisor.init(children, strategy: :one_for_all)
  end
end
