const fs = require('fs');

const readInput = (path) => {
  const input = fs.readFileSync(path, 'utf-8');
  return input.match(/[^\r\n]+/g);
};

module.exports = { readInput };
