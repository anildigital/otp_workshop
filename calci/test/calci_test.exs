defmodule CalciTest do
  use ExUnit.Case
  doctest Calci

  test "greets the world" do
    assert Calci.hello() == :world
  end
end
