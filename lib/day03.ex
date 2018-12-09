# --- Day 3: No Matter How You Slice It ---
defmodule Day03 do
  def square_inches_multi_claimed(list) do
    list
    |> Enum.reduce(squares_fabric(), fn line, squares_fabric ->
      [id, x, y, width, height] = parse_claim(line)

      Enum.reduce(x..(x + width - 1), squares_fabric, fn i, squares_fabric ->
        Enum.reduce(y..(y + height - 1), squares_fabric, fn j, squares_fabric ->
          Matrix.set(squares_fabric, i, j, Matrix.get(squares_fabric, i, j) + 1)
        end)
      end)
    end)
    |> Enum.reduce(0, fn fabric_line, count ->
      count + Enum.reduce(fabric_line, 0, fn fabric_square, count ->
        if fabric_square > 1, do: count + 1, else: count
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

  defp squares_fabric do
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
