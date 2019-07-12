defmodule Calci.Calculator do
  use GenServer

  alias Calci.Calculator

  defstruct value: 0

  # API
  def start_link(_arg \\ []) do
    GenServer.start_link(__MODULE__, Calculator.new(), name: __MODULE__)
  end

  def new do
    %Calculator{value: 0}
  end

  def add(number) do
    GenServer.call(Calculator, {:add, number})
  end

  def get() do
    GenServer.call(Calculator, :get)
  end

  def reset() do
    GenServer.cast(Calculator, :reset)
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

  # Callbacks

  def init(init_value) do
    {:ok, init_value}
  end

  def handle_call({:add, new_number}, _from, state) do
    {:reply, "add #{new_number}", _add(state, new_number)}
  end

  def handle_call(:get, _from, state) do
    :timer.sleep(1000)
    {:reply, _get(state), state}
  end

  def handle_call({:subtract, number}, _from, state) do
    {:reply, "subtract #{number}", _subtract(state, number)}
  end

  def handle_call({:multiply, number}, _from, state) do
    {:reply, "multiply #{number}", _multiply(state, number)}
  end

  def handle_call({:divide, number}, _from, state) do
    {:reply, "divide #{number}", _divide(state, number)}
  end

  def handle_cast(:reset, _state) do
    {:noreply, Calculator.new()}
  end

  # Private functions

  defp _add(%Calculator{value: old_value}, number) do
    %Calculator{value: old_value + number}
  end

  defp _get(%Calculator{value: value}) do
    value
  end

  defp _subtract(%Calculator{value: old_value}, number) do
    %Calculator{value: old_value - number}
  end

  defp _multiply(%Calculator{value: old_value}, number) do
    %Calculator{value: old_value * number}
  end

  defp _divide(%Calculator{value: old_value}, number) do
    %Calculator{value: old_value / number}
  end
end
