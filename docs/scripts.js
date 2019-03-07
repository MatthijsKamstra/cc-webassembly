    // // Check for wasm support.
    // if (!('WebAssembly' in window)) {
    //   alert('you need a browser with wasm support enabled :(');
    // }
    // // Loads a WebAssembly dynamic library, returns a promise.
    // // imports is an optional imports object
    // function loadWebAssembly(filename, imports) {
    //   // Fetch the file and compile it
    //   return fetch(filename)
    //     .then(response => response.arrayBuffer())
    //     .then(buffer => WebAssembly.compile(buffer))
    //     .then(module => {
    //       // Create the imports for the module, including the
    //       // standard dynamic library imports
    //       imports = imports || {};
    //       imports.env = imports.env || {};
    //       imports.env.memoryBase = imports.env.memoryBase || 0;
    //       imports.env.tableBase = imports.env.tableBase || 0;
    //       if (!imports.env.memory) {
    //         imports.env.memory = new WebAssembly.Memory({ initial: 256 });
    //       }
    //       if (!imports.env.table) {
    //         imports.env.table = new WebAssembly.Table({ initial: 0, element: 'anyfunc' });
    //       }
    //       // Create the instance.
    //       // return new WebAssembly.Instance(module, imports);
    //       return new WebAssembly.instantiate(module, imports);
    //     });
    // }
    // // Main part of this example, loads the module and uses it.
    // loadWebAssembly('Main.wasm')
    //   .then(instance => {
    //     var exports = instance.exports; // the exports of that instance
    //     var doubler = exports._doubler; // the "doubler" function (note "_" prefix)
    //     // now we are ready, set up the button so the user can run the code
    //     var button = document.getElementById('run');
    //     button.value = 'Call a method in the WebAssembly module';
    //     button.addEventListener('click', function() {
    //       var input = 21;
    //       alert(input + ' doubled is ' + doubler(input));
    //     }, false);
    //   }
    // );


// // This is our recommended way of loading WebAssembly.
// // https://developers.google.com/web/updates/2018/04/loading-wasm
// (async () => {
//   const fetchPromise = fetch('fibonacci.wasm');
//   const { instance } = await WebAssembly.instantiateStreaming(fetchPromise);
//   const result = instance.exports.fibonacci(42);
//   console.log (`The 42nd Fibonacci number is ${ result }.`);
// })();



// (async () => {
//   const response = await fetch("fibonacci.wasm");
//   const buffer = await response.arrayBuffer();
//   const { instance } = await WebAssembly.instantiate(buffer);
//   const result = instance.exports.fibonacci(42);
//   console.log (`The 42nd Fibonacci number is ${ result }.`);
// })();

// fetch('fibonacci.wasm').then(response =>
//   	response.arrayBuffer()
//   ).then(bytes =>
//     WebAssembly.instantiate(bytes)
//   ).then(obj => {
//       console.log(obj.instance.exports.fibonacci('42'));
//   });


// var importObject = {
//   imports: {
//     imported_func: function(arg) {
//       console.log(arg);
//     }
//   }
// };

// fetch('Main.wasm').then(response =>
//   response.arrayBuffer()
// ).then(bytes =>
//   WebAssembly.instantiate(bytes, importObject)
// ).then(result => {

//   result.instance.exports.exported_func()
// }
// );




let squarer;
let fib;

function loadWebAssembly(fileName) {
  return fetch(fileName)
    .then(response => response.arrayBuffer())
    .then(buffer => WebAssembly.compile(buffer))
    .then(module => {return new WebAssembly.Instance(module) });
};

loadWebAssembly('test.wasm')
  .then(instance => {
    squarer = instance.exports._Z7squareri;
    fib = instance.exports._Z3fibi;
    console.log('Finished compiling! Ready when you are... for example `squarer(9)` / fib(9)');
  });



