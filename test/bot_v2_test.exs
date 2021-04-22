defmodule BotV2Test do
  use ExUnit.Case
  doctest BotV2

  test "greets the world" do
    assert BotV2.hello() == :world
  end
end
