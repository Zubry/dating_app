defmodule DatingApp.Matches.Agent do
  defstruct matched: MapSet.new(), pending: MapSet.new(), received: MapSet.new()

  use Agent

  def start_link(name) do
    Agent.start_link(fn -> %__MODULE__{} end, name: name)
  end

  def send_like(pid, liked_id) do
    Agent.update(pid, fn state ->
      if MapSet.member?(state.received, liked_id) do
        state = update_in(state.received, fn set -> MapSet.delete(set, liked_id) end)
        update_in(state.matched, fn set -> MapSet.put(set, liked_id) end)
      else
        update_in(state.pending, fn set -> MapSet.put(set, liked_id) end)
      end
    end)
  end

  def receive_like(pid, id) do
    Agent.update(pid, fn state ->
      if MapSet.member?(state.pending, id) do
        state = update_in(state.pending, fn set -> MapSet.delete(set, id) end)
        update_in(state.matched, fn set -> MapSet.put(set, id) end)
      else
        update_in(state.received, fn set -> MapSet.put(set, id) end)
      end
    end)
  end

  def get(pid) do
    Agent.get(pid, fn state -> state end)
  end
end
