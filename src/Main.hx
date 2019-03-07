
// @:buildXml("
// <linker id='exe' exe='emcc'>
// 	<flag value='-s' />
// 	<flag value='WASM=1' />
// </linker>
// ")

@:buildXml("
<linker id='exe' exe='emcc'>
	<flag value='-s' />
	<flag value='WASM=1' />
	<flag value='--bind' />
	<flag value='-s' />
	<flag value='TOTAL_MEMORY=33554432' />
	<flag value='-O3' />
</linker>
")


@:cppFileCode('
#include <emscripten/bind.h>
using namespace emscripten;

EMSCRIPTEN_BINDINGS(my_module) {
        class_<Main>("MyWrapper")
        .class_function("decompress", &Main_obj::DecompressI);
}
')
class Main {

	public function new () {
		trace('Hello Web Assembly');
		trace( fib(5) ) ;
		trace( fib(6) );
		trace( fib(7) );
		trace( fib(10) );
	}

	function fib(n: Int): Int {
		var i: Int;
		var t: Int;
		var a: Int = 0;
		var b: Int = 1;
		for (i in 0...n){
			t = a + b;
			a = b;
			b = t;
		}
		return b;
	}

	function fibonacci(num){
		var a = 1, b = 0, temp;
		while (num >= 0){
			temp = a;
			a = a + b;
			b = temp;
			num--;
		}
		return b;
	}


	public static function DecompressI(width:Int, height:Int, ?src:haxe.io.UInt8Array, ?dst:haxe.io.Int32Array):Void {
		trace('DecompressI ($width, $height)');
	}


	static public function main () {
		var app = new Main ();
	}
}