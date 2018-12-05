# --- Day 2: Inventory Management System ---
defmodule Day02 do
  def checksum(stream) do
    {twice, thrice} =
      stream
      |> Stream.map(fn line ->
        String.trim(line)
        |> char_occurrences()
        |> exactly_twice_or_thrice()
      end)
      |> Enum.reduce({0, 0}, fn {twice, thrice}, {total_twice, total_thrice} ->
        {total_twice + twice, total_thrice + thrice}
      end)

    twice * thrice
  end

  @doc """
  Char occurrences for a given string.

  ## Examples

      iex> Day02.char_occurrences("abcab")
      %{"a" => 2, "b" => 2, "c" => 1}

  """
  def char_occurrences(string) do
    string
    |> String.graphemes()
    |> Enum.reduce(%{}, fn char, acc ->
      Map.update(acc, char, 1, &(&1 + 1))
    end)
  end

  defp exactly_twice_or_thrice(char_occurrences) do
    {exactly(char_occurrences, 2), exactly(char_occurrences, 3)}
  end

  defp exactly(char_occurrences, occurrences) do
    if Enum.any?(char_occurrences, fn ({_, v}) -> v == occurrences end), do: 1, else: 0
  end

  defp file_stream do
    File.stream!("input/day02.txt", [], :line)
  end
end
