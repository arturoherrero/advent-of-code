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

  test "correct_box_id/1" do
    stream = [
      "abcde\n",
      "fghij\n",
      "klmno\n",
      "pqrst\n",
      "fguij\n",
      "axcye\n",
      "wvxyz\n",
    ]

    assert Day02.correct_box_id(stream) == "fgij"
  end
end
