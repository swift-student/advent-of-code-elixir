defmodule AdventOfCode.Solution.Year2024.Day01 do
  use AdventOfCode.Solution.SharedParse

  def part1({left_list, right_list}) do
    left_list = Enum.sort(left_list)
    right_list = Enum.sort(right_list)

    Enum.zip(left_list, right_list)
    |> Enum.map(fn pair ->
      {left, right} = pair
      abs(left - right)
    end)
    |> Enum.reduce(0, &+/2)
  end

  def part2({left_list, right_list}) do
    frequencies = Enum.frequencies(right_list)

    Enum.reduce(left_list, 0, fn num, acc ->
      acc + num * Map.get(frequencies, num, 0)
    end)
  end

  def parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      String.split(line, " ", trim: true)
      |> Enum.map(&String.to_integer(&1))
      |> List.to_tuple()
    end)
    |> Enum.unzip()
  end
end
