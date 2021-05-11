defmodule GAPIServerTest do
  use ExUnit.Case
  doctest GAPIServer

  test "greets the world" do
    assert GAPIServer.hello() == :world
  end
end
