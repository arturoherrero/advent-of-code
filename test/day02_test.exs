defmodule Day02Test do
  use ExUnit.Case
  doctest Day02

  test "checksum/1" do
    stream = [
      "abcdef\n",
      "bababc\n",
      "abbcde\n",
      "abcccd\n",
      "aabcdd\n",
    ]

    assert Day02.checksum(stream) == 6
  end
end
