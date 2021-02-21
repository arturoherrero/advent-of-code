# --- Day 1: Chronal Calibration ---
defmodule Day01 do
  def final_frequency(stream) do
    stream
    |> map_to_integer()
    |> Enum.sum()
  end

  def frequency_reached_twice(stream) do
    stream
    |> map_to_integer()
    |> Stream.cycle()
    |> Enum.reduce_while({0, []}, fn x, {current_frequency, history_frequencies} ->
      new_frequency = current_frequency + x

      if Enum.member?(history_frequencies, new_frequency) do
        {:halt, new_frequency}
      else
        {:cont, {new_frequency, [new_frequency | history_frequencies]}}
      end
    end)
  end

  defp map_to_integer(stream) do
    stream
    |> Stream.map(fn line -> String.trim(line) |> String.to_integer end)
  end

  defp file_stream do
    File.stream!("input/day01.txt", [], :line)
  end
end
