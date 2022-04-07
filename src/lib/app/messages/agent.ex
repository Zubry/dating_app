defmodule DatingApp.Messages.Agent do
  defstruct id: nil, messages: %{}

  use Agent

  def start_link(id) do
    Agent.start_link(fn -> %__MODULE__{ id: id } end, name: {:via, Registry, {DatingApp.Messages.Registry, id}})
  end

  def add_message(pid, from, to, message) do
    Agent.update(pid, fn state ->
      if state.id == from do
        update_in(state.messages[to], fn
          nil -> [%{from: from, message: message}]
          messages -> [%{from: from, message: message}] ++ messages
        end)
      else
        update_in(state.messages[from], fn
          nil -> [%{from: from, message: message}]
          messages -> [%{from: from, message: message}] ++ messages
        end)
      end
    end)
  end

  def get(pid) do
    Agent.get(pid, fn state -> state end)
  end
end
