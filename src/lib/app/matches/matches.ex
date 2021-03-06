defmodule DatingApp.Matches do
  def open(id) do
    DynamicSupervisor.start_child(DatingApp.Matches.DynamicSupervisor, {DatingApp.Matches.Agent, id})
  end

  def like(id, liked_id) do
    case Registry.lookup(DatingApp.Matches.Registry, id) do
      [{pid, _}] -> DatingApp.Matches.Agent.send_like(pid, liked_id)
      _ -> {:error, :not_found}
    end

    case Registry.lookup(DatingApp.Matches.Registry, liked_id) do
      [{pid, _}] -> DatingApp.Matches.Agent.receive_like(pid, id)
      _ -> {:error, :not_found}
    end
  end

  def get(id) do
    case Registry.lookup(DatingApp.Matches.Registry, id) do
      [{pid, _}] -> DatingApp.Matches.Agent.get(pid)
      _ -> {:error, :not_found}
    end
  end

  def add_message(id, from, to, message) do
    case Registry.lookup(DatingApp.Matches.Registry, id) do
      [{pid, _}] -> DatingApp.Matches.Agent.add_message(pid, from, to, message)
      _ -> {:error, :not_found}
    end
  end

  @doc """
  Returns true if a and b are matched
  """
  def matched?(a, b) do
    case Registry.lookup(DatingApp.Matches.Registry, a) do
      [{pid, _}] ->
        DatingApp.Matches.Agent.get(pid)
        |> Map.get(:matched, MapSet.new())
        |> MapSet.member?(b)
      _ -> false
    end
  end
end
