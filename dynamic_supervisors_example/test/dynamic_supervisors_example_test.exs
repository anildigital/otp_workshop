defmodule DynamicSupervisorsExampleTest do
  use ExUnit.Case
  doctest DynamicSupervisorsExample

  test "greets the world" do
    assert DynamicSupervisorsExample.hello() == :world
  end
end
