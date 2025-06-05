defmodule AdventOfCode.Solution.Year2024.Day01Test do
  use ExUnit.Case, async: true

  import AdventOfCode.Solution.Year2024.Day01

  setup do
    [
      parsed_input:
        """
        3   4
        4   3
        2   5
        1   3
        3   9
        3   3
        """
        |> parse()
    ]
  end

  test "part1", %{parsed_input: parsed_input} do
    result = part1(parsed_input)

    assert result == 11
  end

  test "part2", %{parsed_input: parsed_input} do
    result = part2(parsed_input)

    assert result == 31
  end
end
