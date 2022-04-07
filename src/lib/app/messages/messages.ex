defmodule DatingApp.Messages do
  def open(id) do
    DynamicSupervisor.start_child(DatingApp.Messages.DynamicSupervisor, {DatingApp.Messages.Agent, id})
  end

  def get(id) do
    case Registry.lookup(DatingApp.Messages.Registry, id) do
      [{pid, _}] -> DatingApp.Messages.Agent.get(pid)
      _ -> {:error, :not_found}
    end
  end

  def add_message(id, from, to, message) do
    case Registry.lookup(DatingApp.Messages.Registry, id) do
      [{pid, _}] -> DatingApp.Messages.Agent.add_message(pid, from, to, message)
      _ -> {:error, :not_found}
    end
  end
end
