defmodule Calci.Calculator do
  use GenServer

  alias Calci.Calculator

  def start_link(_arg \\ []) do
    GenServer.start_link(__MODULE__, 0, name: __MODULE__)
  end

  def init(initial_value) do
    {:ok, initial_value}
  end

  def add(number) do
    GenServer.call(Calculator, {:add, number})
  end

  def subtract(number) do
    GenServer.call(Calculator, {:subtract, number})
  end

  def multiply(number) do
    GenServer.call(Calculator, {:multiply, number})
  end

  def divide(number) do
    GenServer.call(Calculator, {:divide, number})
  end

  def get() do
    GenServer.call(Calculator, :get)
  end

  def reset() do
    GenServer.cast(Calculator, :reset)
  end

  def handle_call({:add, number}, _from, state) do
    {:reply, "add #{number}", state + number}
  end

  def handle_call({:subtract, number}, _from, state) do
    {:reply, "subtract #{number}", state - number}
  end

  def handle_call({:multiply, number}, _from, state) do
    {:reply, "subtract #{number}", state * number}
  end

  def handle_call({:divide, number}, _from, state) do
    {:reply, "divide #{number}", state / number}
  end

  def handle_call(:get, _from, state) do
    :timer.sleep(1000)
    {:reply, state, state}
  end

  def handle_cast(:reset, _state) do
    {:noreply, 0}
  end
end
