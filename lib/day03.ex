# --- Day 3: No Matter How You Slice It ---
defmodule Day03 do
  def square_inches_multi_claimed(list) do
    fabric_with_claims(list)
    |> Enum.reduce(0, fn fabric_line, count ->
      count + Enum.reduce(fabric_line, 0, fn fabric_square, count ->
        if fabric_square > 1, do: count + 1, else: count
      end)
    end)
  end

  def claim_id_not_overlapping(list) do
    list
    |> Enum.reduce([nil, fabric_with_claims(list)], fn line, [id, fabric] ->
      [current_id, x, y, width, height] = parse_claim(line)

      {overlapping_claim, fabric} = Enum.reduce(x..(x + width - 1), {false, fabric}, fn i, {overlapping_claim, fabric} ->
        Enum.reduce(y..(y + height - 1), {overlapping_claim, fabric}, fn j, {overlapping_claim, fabric} ->
          overlapping_claim = if overlapping_claim || Matrix.get(fabric, i, j) > 1, do: true, else: overlapping_claim
          {overlapping_claim, fabric}
        end)
      end)

      id = if overlapping_claim, do: id, else: current_id
      [id, fabric]
    end)
    |> List.first
  end

  defp fabric_with_claims(list) do
    list
    |> Enum.reduce(initial_fabric(), fn line, fabric ->
      [_, x, y, width, height] = parse_claim(line)

      Enum.reduce(x..(x + width - 1), fabric, fn i, fabric ->
        Enum.reduce(y..(y + height - 1), fabric, fn j, fabric ->
          Matrix.set(fabric, i, j, Matrix.get(fabric, i, j) + 1)
        end)
      end)
    end)
  end

  @doc """
  Parse id, x, y, width and height from the claim string.

  ## Examples

    iex> Day03.parse_claim("#1 @ 1,3: 4x4")
    [1, 1, 3, 4, 4]

  """
  def parse_claim(line) do
    line
    |> String.split(["#", " @ ", ",", ": ", "x"], trim: true)
    |> Enum.map(&String.to_integer(&1))
  end

  defp initial_fabric do
    Matrix.create(1000, 1000)
  end
end

defmodule Matrix do
  def create(width, height) do
    List.duplicate(0, width)
    |> List.duplicate(height)
  end

  def set(matrix, x, y, value) do
    List.replace_at(matrix,
      y, List.replace_at(Enum.at(matrix, y), x, value)
    )
  end

  def get(matrix, x, y) do
    matrix
    |> Enum.at(y)
    |> Enum.at(x)
  end
end

defmodule FileReader do
  def readlines do
    File.read!("input/day03.txt")
    |> String.split("\n", trim: true)
  end
end
