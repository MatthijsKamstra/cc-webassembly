# cc-webassembly

See if I can get the heavy work done by webassembly

Haxe, CPP, JavaScript & WebAssembly

## Gist

<https://gist.github.com/MatthijsKamstra/cbae06ae1dc3561621e489ae4d7a8aab>

## Disclaimer

I didn't write this, but wanted to make sure the information didn't disappear.
Currently the Haxe community doesn't use [the google group](https://groups.google.com/forum/#!topic/haxelang/Pcm38LPFjW0) anymore and this information was written down on that group.

I have tested it on OsX, and at first I tried `brew` but that failed (have no clue why)
And after that  I just followed the instructions on [getting started on webassembly](http://webassembly.org/getting-started/developers-guide/).

```bash
git clone https://github.com/juj/emsdk.git
cd emsdk
./emsdk install latest
./emsdk activate latest
```
and wait... a ... while ...

~~source ./emsdk_env.sh~~

run this

```bash
source ./emsdk_env.sh --build=Release
```

and then it worked.

Probably you will need to install hxcpp

```bash
haxelib install hxcpp
```


The rest is written by Russ (that's all I know about the writer)


## intro

Here's a simple haxe 'Hello World' using wasm and the latest haxe+hxcpp.

First, visit http://webassembly.org/getting-started/developers-guide/ and follow the instructions there to setup Emscripten. Ensure the setup is working by doing the "Compile and run a simple program" step.

Then, add these two files to a project folder somewhere:

`Main.hx`:

```haxe
@:buildXml("
<linker id='exe' exe='emcc'>
	<flag value='-s' />
	<flag value='WASM=1' />
</linker>
")
class Main {
	static function main() {
		trace('Hello Web Assembly');
	}
}
```

`build.hxml`:

```xml
# Windows maybe needs this define
-D EMSCRIPTEN_SDK

# If you want the .html file showing how to embed the wasm
-D HXCPP_LINK_EMSCRIPTEN_EXT=.html

# Tell hxcpp to use emscripten-toolchain.xml
-D emscripten

-cpp out
-main Main
```

## rest

Next, setup Emscripten environment vars in your shell:
```
source /path/to/emsdk_env.sh
```

Then compile:
```
haxe build.hxml
```

And finally, run in the browser:
```
emrun out/Main.html
```

Or run in Node JS 8:
```
cd out
/path/to/nodejs8/node Main.js
```

Also check out the [emscripten-toolchain.xml](https://github.com/HaxeFoundation/hxcpp/blob/master/toolchain/emscripten-toolchain.xml) file in hxcpp for more Emscripten specific defines.

## Webassembly Haxe

original:

- <https://groups.google.com/forum/#!topic/haxelang/Pcm38LPFjW0>

stresstest

- <https://community.haxe.org/t/haxe-and-emscripten/780>
- <https://github.com/damoebius/HaxeBench/tree/master/src/hxcpp>

`MyWrapper.decompress`

- <https://github.com/damoebius/HaxeBench/blob/5cf2d93e49cac3fa80654a4178928a3c65edd263/www/haxeasmjs.html>



## source

<https://mbebenita.github.io/WasmExplorer/>


- https://webassembly.org/getting-started/developers-guide/
- https://github.com/JasonWeathersby/WASMSobel/blob/master/index.html
- https://github.com/mdn/webassembly-examples/



Simple tut

- https://medium.freecodecamp.org/get-started-with-webassembly-using-only-14-lines-of-javascript-b37b6aaca1e4 / <https://github.com/lordpoint/wasm-demo>
- https://blog.scottlogic.com/2018/04/26/webassembly-by-hand.html
- https://medium.com/@BenedekGagyi/the-simplest-way-to-get-started-with-webassembly-1f92f6f90d24 (fibernatice)


x

- https://flaviocopes.com/webassembly/
- https://codelabs.developers.google.com/codelabs/web-assembly-intro/index.html#7


- https://github.com/alexnoz/wasm-class-sample



## C++

```c++
int squarer(int num) {
  return num * num;
}
int fib(int n){
	int i;
	int t;
	int a = (int)0;
	int b = (int)1;
		{
		int _g1 = (int)0;
		int _g = n;
		while((_g1 < _g)){
			_g1 = (_g1 + (int)1);
			int i1 = (_g1 - (int)1);
			t = (a + b);
			a = b;
			b = t;
		}
	}
	return b;
}
```
