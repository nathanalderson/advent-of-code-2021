defmodule Solution do
  def parse(lines) do
    lines
    |> Enum.map(&String.split/1)
    |> Enum.map(fn [dir, units] ->
      { String.to_atom(dir), String.to_integer(units) }
    end)
  end

  def part1(data) do
    data
    |> List.foldl({0, 0}, fn {dir, units}, {pos, depth} ->
      case dir do
        :forward -> {pos + units, depth}
        :down -> {pos, depth + units}
        :up -> {pos, depth - units}
      end
    end)
    |> (fn {pos, depth} -> pos * depth end).()
  end

  def part2(data) do
    data
    |> List.foldl({0, 0, 0}, fn {dir, units}, {pos, depth, aim} ->
      case dir do
        :forward -> {pos+units, depth+(aim*units), aim}
        :down -> {pos, depth, aim+units}
        :up -> {pos, depth, aim-units}
      end
    end)
    |> (fn {pos, depth, _} -> pos * depth end).()
  end

  def main do
    data = File.read!("input") |> String.trim |> String.split("\n") |> parse
    ans1 = part1(data)
    ans2 = part2(data)
    {ans1, ans2}
  end
end

{ans1, ans2} = Solution.main
IO.puts(ans1)
IO.puts(ans2)
