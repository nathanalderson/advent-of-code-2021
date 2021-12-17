defmodule Day04 do
  def parse(input) do
    [calls_str, rest] = String.split(input, "\n", parts: 2)
    calls = String.split(calls_str, ",")
            |> Enum.map(&String.to_integer/1)
    board_strs = String.split(rest, "\n\n", trim: true)
    boards = for board_str <- board_strs do
      String.split(board_str, ~r/\s+/, trim: true)
      |> Enum.map(&String.to_integer/1)
    end
    {calls, boards}
  end

  def do_round({boards, calls, _just_called}) do
    [call | new_calls] = calls
    new_boards = for board <- boards do
      Enum.map(board, fn
        ^call -> :marked
        x -> x
      end)
    end
    {new_boards, new_calls, call}
  end

  def winner?(board) do
    board_tuple = List.to_tuple(board)
    size = tuple_size(board_tuple)
    width = trunc(:math.sqrt(size))
    row_indexes = Enum.chunk_every(0..size-1, width)
    col_indexes = for i <- 0..width-1, do: Enum.to_list(i..size-1//width)
    diag1_indexes = Enum.to_list(0..size-1//width+1)
    diag2_indexes = Enum.to_list(width-1..size-2//width-1)
    line_indexes = row_indexes ++ col_indexes ++ [diag1_indexes] ++ [diag2_indexes]
    Enum.any?(for idxs <- line_indexes do
      Enum.all?(for idx <- idxs, do: elem(board_tuple, idx) == :marked)
    end)
  end

  def score(board, last_called) do
    last_called * Enum.sum(Enum.filter(board, &is_integer/1))
  end

  def part1(input) do
    {calls, boards} = parse(input)
    {final_boards, _, last_called} = Stream.iterate({boards, calls, nil}, &do_round/1)
      |> Enum.find(nil, fn {boards, _, _} -> Enum.any?(Enum.map(boards, &winner?/1)) end)
    for board <- final_boards,
      winner?(board)
    do
      score(board, last_called)
    end
  end

  def main do
  end
end

