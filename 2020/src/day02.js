const { readInput } = require("./utils.js")
const inputArray = readInput("input/day02.txt")

const countValidPasswords = (array) => array.reduce((total, entry) => {
  const [policy, letterPrompt, password] = entry.split(" ")
  const [policyMin, policyMax] = policy.split("-")
  const letter = letterPrompt[0]
  const count = (password.match(new RegExp(letter, "g")) || []).length

  if (count >= policyMin && count <= policyMax) {
    total += 1
  }

  return total
}, 0)

const countValidPasswordsPartTwo = (array) => array.reduce((total, entry) => {
  const [positions, letterPrompt, password] = entry.split(" ")
  const [positionMin, positionMax] = positions.split("-").map((x) => x - 1)
  const letter = letterPrompt[0]

  if (password[positionMin] === letter ^ password[positionMax] === letter) {
    total += 1
  }

  return total
}, 0)

module.exports = { countValidPasswords, countValidPasswordsPartTwo }
