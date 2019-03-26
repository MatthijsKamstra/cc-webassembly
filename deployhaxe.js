const fs = require('fs');

fs.copyFileSync('bin/Main.js', 'www/Main.js');
fs.copyFileSync('bin/Main.wasm', 'www/Main.wasm');