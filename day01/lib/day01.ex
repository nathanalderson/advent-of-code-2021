defmodule Day01 do
  def part1(input) do
    input
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.count(fn [a, b] -> a < b end)
  end

  def part2(input) do
    input
    |> Enum.chunk_every(3, 1, :discard)
    |> Enum.map(&Enum.sum/1)
    |> part1
  end

  def main do
    data = File.read!("input")
           |> String.split
           |> Enum.map(&String.to_integer/1)
    ans1 = part1(data)
    ans2 = part2(data)
    IO.puts(ans1)
    IO.puts(ans2)
  end
end
