defmodule AdventOfCode.Solution.Year2024.Day02 do
  use AdventOfCode.Solution.SharedParse

  def part1(parsed_input) do
    parsed_input
    |> Enum.count(&is_report_valid?/1)
  end

  def part2(parsed_input) do
    parsed_input
    |> Enum.count(&is_report_valid_with_damping?/1)
  end

  def parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_line/1)
  end

  defp parse_line(line) do
    line
    |> String.split(" ")
    |> Enum.map(&String.to_integer/1)
  end

  defp is_report_valid?(report) do
    is_decreasing_slowly?(report) or is_decreasing_slowly?(Enum.reverse(report))
  end

  defp is_report_valid_with_damping?(report) do
    is_report_valid?(report) or
      0..(length(report) - 1)
      |> Enum.any?(fn index ->
        report
        |> List.delete_at(index)
        |> is_report_valid?()
      end)
  end

  defp is_decreasing_slowly?([_]), do: true

  defp is_decreasing_slowly?([head, next]) do
    diff = head - next
    diff >= 1 and diff <= 3
  end

  defp is_decreasing_slowly?([head, next | tail]) do
    is_decreasing_slowly?([head, next]) and is_decreasing_slowly?([next | tail])
  end
end
