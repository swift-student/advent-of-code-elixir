defmodule AdventOfCode.Solution.Year2024.Day02Test do
  use ExUnit.Case, async: true

  import AdventOfCode.Solution.Year2024.Day02

  setup do
    [
      parsed_input:
        """
        7 6 4 2 1
        1 2 7 8 9
        9 7 6 2 1
        1 3 2 4 5
        8 6 4 4 1
        1 3 6 7 9
        """
        |> parse()
    ]
  end

  test "part1", %{parsed_input: parsed_input} do
    result = part1(parsed_input)

    assert result == 2
  end

  test "part2", %{parsed_input: parsed_input} do
    result = part2(parsed_input)

    assert result == 4
  end
end
