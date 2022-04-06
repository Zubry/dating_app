defmodule DatingApp.Matches.Agent do
  defstruct id: nil, matched: MapSet.new(), pending: MapSet.new(), received: MapSet.new(), messages: %{}

  use Agent

  def start_link(id) do
    Agent.start_link(fn -> %__MODULE__{ id: id } end, name: {:via, Registry, {DatingApp.Matches.Registry, id}})
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

  def add_message(pid, from, to, message) do
    Agent.update(pid, fn state ->
      if state.id == from do
        put_in(state.messages[to], %{from: from, message: message})
      else
        put_in(state.messages[from], %{from: from, message: message})
      end
    end)
  end

  def get(pid) do
    Agent.get(pid, fn state -> state end)
  end
end
