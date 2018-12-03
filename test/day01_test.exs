defmodule Day01Test do
  use ExUnit.Case

  test "final_frequency/1" do
    stream = [
      "+1\n",
      "+1\n",
      "-1\n",
    ]

    assert Day01.final_frequency(stream) == 1
  end

  test "frequency_reached_twice/1" do
    stream = [
     "+3\n",
     "+3\n",
     "+4\n",
     "-2\n",
     "-4\n",
    ]

    assert Day01.frequency_reached_twice(stream) == 10
  end
end
