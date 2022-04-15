defmodule Riak do
  def ping() do
    send(:ping)
  end

  def put(bucket, key, value) do
    send({:put, bucket, key, value})
  end

  def get(bucket, key) do
    send({:get, bucket, key})
  end

  defp send(request) do
    :poolboy.transaction(:riak, fn pid -> GenServer.call(pid, request) end)
  end
end

defmodule Riak.Supervisor do
  @moduledoc false

  use Supervisor

  def start_link(init_arg) do
    Supervisor.start_link(__MODULE__, init_arg, name: __MODULE__)
  end

  @impl true
  def init(_init_arg) do
    children = [
      :poolboy.child_spec(:worker, poolboy_config()),
    ]

    # If the event handle crashes, we need to restart everything
    Supervisor.init(children, strategy: :one_for_all)
  end

  defp poolboy_config() do
    [
      name: {:local, :riak},
      worker_module: Riak.Worker,
      size: 5,
      max_overflow: 2
    ]
  end
end

defmodule Riak.Worker do
  use GenServer

  def start_link(_) do
    GenServer.start_link(__MODULE__, nil)
  end

  def init(_) do
    :riakc_pb_socket.start_link('riak', 8087)
  end

  def handle_call(:ping, _from, pid) do
    res = :riakc_pb_socket.ping(pid)
    {:reply, res, pid}
  end

  def handle_call({:put, bucket, key, value}, _from, pid) do
    obj = :riakc_obj.new(:erlang.term_to_binary(bucket), :erlang.term_to_binary(key), :erlang.term_to_binary(value))
    res = :riakc_pb_socket.put(pid, obj)
    {:reply, res, pid}
  end

  def handle_call({:get, bucket, key}, _from, pid) do
    case :riakc_pb_socket.get(pid, :erlang.term_to_binary(bucket), :erlang.term_to_binary(key)) do
      {:ok, obj} ->
        {:reply, {:ok, obj |> :riakc_obj.get_value() |> :erlang.binary_to_term()}, pid}
      res ->
        {:reply, res, pid}
    end
  end
end
