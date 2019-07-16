defmodule MemoizedTest do
  use ExUnit.Case
  doctest Memoized

  test "greets the world" do
    assert Memoized.hello() == :world
  end
end
