/* eslint-disable */

const { readInput } = require('./utils.js');
const inputArray = readInput('input/day01.txt');

const findTwoSum2020AndMultiply = (array) => {
  array = array.map((x) => Number(x));

  for (let i = 0; i < array.length; i += 1) {
    const entry1 = array[i];

    for (let j = i + 1; j < array.length; j += 1) {
      const entry2 = array[j];

      if (entry1 + entry2 === 2020) {
        return entry1 * entry2;
      }
    }
  }
};

const findThreeSum2020AndMultiply = (array) => {
  array = array.map((x) => Number(x));

  for (let i = 0; i < array.length; i += 1) {
    const entry1 = array[i];

    for (let j = i + 1; j < array.length; j += 1) {
      const entry2 = array[j];

      for (let k = j + 1; k < array.length; k += 1) {
        const entry3 = array[k];

        if (entry1 + entry2 + entry3 === 2020) {
          return entry1 * entry2 * entry3;
        }
      }
    }
  }
};

module.exports = { findTwoSum2020AndMultiply, findThreeSum2020AndMultiply };
