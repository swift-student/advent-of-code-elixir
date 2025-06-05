defmodule AdventOfCode.Solution.Year2024.Day03 do
  use AdventOfCode.Solution.SharedParse

  def part1(tokens) do
    multiply_and_sum(tokens)
  end

  def part2(tokens) do
    multiply_and_sum2(tokens)
  end

  def parse(input) do
    {:ok, tokens, _} =
      input
      |> String.trim()
      |> String.to_charlist()
      |> :day_03_lexer.string()

    tokens
  end

  # Part 1

  defp multiply_and_sum([]), do: 0

  defp multiply_and_sum([
         {:mul, _},
         {:"(", _},
         {:int, _, x},
         {:",", _},
         {:int, _, y},
         {:")", _} | tail
       ]) do
    x * y + multiply_and_sum(tail)
  end

  defp multiply_and_sum([_head | tail]) do
    multiply_and_sum(tail)
  end

  # Part 2

  defp multiply_and_sum2([]), do: 0

  defp multiply_and_sum2([
         {:mul, _},
         {:"(", _},
         {:int, _, x},
         {:",", _},
         {:int, _, y},
         {:")", _} | tail
       ]) do
    x * y + multiply_and_sum2(tail)
  end

  defp multiply_and_sum2([{:dont, _} | tail]) do
    dont_until_do(tail)
  end

  defp multiply_and_sum2([_head | tail]) do
    multiply_and_sum2(tail)
  end

  defp dont_until_do([{:do, _} | tail]) do
    multiply_and_sum2(tail)
  end

  defp dont_until_do([_head | tail]) do
    dont_until_do(tail)
  end
end
