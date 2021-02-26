const { countValidPasswords, countValidPasswordsPartTwo } = require('../day02');

test('countValidPasswords', () => {
  expect(countValidPasswords(
    [
      '1-3 a: abcde',
      '1-3 b: cdefg',
      '2-9 c: ccccccccc',
    ],
  )).toBe(2);
});

test('countValidPasswordsPartTwo', () => {
  expect(countValidPasswordsPartTwo(
    [
      '1-3 a: abcde',
      '1-3 b: cdefg',
      '2-9 c: ccccccccc',
    ],
  )).toBe(1);
});
