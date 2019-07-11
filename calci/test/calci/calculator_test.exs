defmodule Calci.CalculatorTest do
  use ExUnit.Case

  alias Calci.Calculator

  setup do
    Calculator.start_link()
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
end
