const fs = require('fs');

fs.copyFileSync('bin/Main.js', 'docs/Main.js');
fs.copyFileSync('bin/Main.wasm', 'docs/Main.wasm');

