defmodule Calci.CalculatorTest do
  use ExUnit.Case

  alias Calci.Calculator

  setup do
    start_supervised(Calculator)
    Calculator.reset()
    {:ok, %{}}
  end

  test "add 100" do
    Calculator.add(100)
    result = Calculator.get()

    assert 100 == result
  end

  test "add 100 twice" do
    Calculator.add(100)
    Calculator.add(100)
    result = Calculator.get()

    assert 200 == result
  end

  test "reset to 0" do
    Calculator.add(100)
    Calculator.reset()

    result = Calculator.get()

    assert 0 == result
  end

  test "subtract 100" do
    Calculator.add(100)
    Calculator.subtract(100)

    result = Calculator.get()

    assert 0 == result
  end

  test "multiple by 5" do
    Calculator.add(100)
    Calculator.multiply(5)

    result = Calculator.get()

    assert 500 == result
  end

  test "divide by 100" do
    Calculator.add(300)
    Calculator.divide(100)

    result = Calculator.get()

    assert 3 == result
  end

  # test "divide by 0" do
  #   Calculator.add(100)

  #   assert_raise ArithmeticError, fn ->
  #     Calculator.divide(0)
  #   end
  # end
end
