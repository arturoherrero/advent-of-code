const { findTwoSum2020AndMultiply, findThreeSum2020AndMultiply } = require("../day01")

test("findTwoSum2020AndMultiply", () => {
  expect(findTwoSum2020AndMultiply(
    [
      "1721",
      "979",
      "366",
      "299",
      "675",
      "1456",
    ],
  )).toBe(514579)
})

test("findThreeSum2020AndMultiply", () => {
  expect(findThreeSum2020AndMultiply(
    [
      "1721",
      "979",
      "366",
      "299",
      "675",
      "1456",
    ],
  )).toBe(241861950)
})
