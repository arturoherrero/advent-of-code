/* eslint-disable */

const { readInput } = require('./utils.js');
const inputArray = readInput('input/day01.txt');

const findTwoSum2020AndMultiply = (array) => {
  loop:
  for (let i = 0; i < array.length; i += 1) {
    var entry1 = Number(array[i]);

    for (let j = i + 1; j < array.length; j += 1) {
      var entry2 = Number(array[j]);

      if (entry1 + entry2 === 2020) {
        break loop;
      }
    }
  }

  return entry1 * entry2;
};

const findThreeSum2020AndMultiply = (array) => {
  loop:
  for (let i = 0; i < array.length; i += 1) {
    var entry1 = Number(array[i]);

    for (let j = i + 1; j < array.length; j += 1) {
      var entry2 = Number(array[j]);

      for (let k = j + 1; k < array.length; k += 1) {
        var entry3 = Number(array[k]);

        if (entry1 + entry2 + entry3 === 2020) {
          break loop;
        }
      }
    }
  }

  return entry1 * entry2 * entry3;
};

module.exports = { findTwoSum2020AndMultiply, findThreeSum2020AndMultiply };
