ExUnit.start()

defmodule SolutionTest do
  Code.require_file "solution.exs", __DIR__
  use ExUnit.Case

  setup do
    [
      input: [
        "forward 5",
        "down 5",
        "forward 8",
        "up 3",
        "down 8",
        "forward 2",
      ]
    ]
  end

  test "parse" do
    input = ["forward 5"]
    assert Solution.parse(input) == [{:forward, 5}]
  end

  test "part1", context do
    assert Solution.part1(Solution.parse(context[:input])) == 150
  end

  test "part2", context do
    assert Solution.part2(Solution.parse(context[:input])) == 900
  end

  test "solution" do
    {ans1, ans2} = Solution.main()
    assert ans1 == 1690020
    assert ans2 == 1408487760
  end

end
