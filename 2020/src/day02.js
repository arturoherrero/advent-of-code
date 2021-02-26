/* eslint-disable */

const fs = require('fs');

const input = fs.readFileSync('input/day02.txt').toString('utf-8');
const inputArray = input.match(/[^\r\n]+/g);

const countValidPasswords = (array) => array.reduce((total, entry) => {
  const [policy, letterPrompt, password] = entry.split(' ');
  const [policyMin, policyMax] = policy.split('-');
  const letter = letterPrompt.slice(0, -1);
  const count = (password.match(new RegExp(letter, 'g')) || []).length;

  if (count >= policyMin && count <= policyMax) {
    total += 1;
  }

  return total;
}, 0);

const countValidPasswordsPartTwo = (array) => array.reduce((total, entry) => {
  const [positions, letterPrompt, password] = entry.split(' ');
  const [positionMin, positionMax] = positions.split('-').map((x) => x - 1);
  const letter = letterPrompt.slice(0, -1);

  if (password[positionMin] === letter ^ password[positionMax] === letter) {
    total += 1;
  }

  return total;
}, 0);

module.exports = { countValidPasswords, countValidPasswordsPartTwo };
