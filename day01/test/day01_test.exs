defmodule Day01Test do
  use ExUnit.Case
  doctest Day01

  test "part1" do
    input = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
    assert Day01.part1(input) == 7
  end

  test "part2" do
    input = [199, 200, 208, 210, 200, 207, 240, 269, 260, 263]
    assert Day01.part2(input) == 5
  end
end
