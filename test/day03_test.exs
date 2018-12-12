defmodule Day03Test do
  use ExUnit.Case
  doctest Day03

  test "square_inches_multi_claimed/1" do
    input = [
      "#1 @ 1,3: 4x4",
      "#2 @ 3,1: 4x4",
      "#3 @ 5,5: 2x2",
    ]

    assert Day03.square_inches_multi_claimed(input) == 4
  end

  test "claim_id_not_overlapping/1" do
    input = [
      "#1 @ 1,1: 2x2",
      "#2 @ 1,3: 4x4",
      "#3 @ 3,1: 4x4",
      "#4 @ 5,5: 2x2",
      "#5 @ 5,6: 2x2",
    ]

    assert Day03.claim_id_not_overlapping(input) == 1
  end
end
