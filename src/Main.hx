package;

import model.constants.App;
import ScreenPressor;
import Tester;
import MyClass;

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

		// class_<Tester>("Test")
		// .constructor<int, int>()
		// // .class("DecompressFrame", &Tester_obj::DecompressFrame)
		// ;

		class_<Tester>("Test")
        .class_function("decompress", &Tester_obj::Decomp)
		;

		class_<MyClass>("MyClass")
		.constructor<int>()
		// .constructor(&MyClass_obj::__new, allow_raw_pointers())
		// .function("incrementX", &MyClass_obj::incrementX)
		// .property("x", &MyClass_obj::get_x, &MyClass_obj::set_x)
		.class_function("getStringFromInstance", &MyClass_obj::getStringFromInstance)
		;
}
')
class Main {
	public static var SP:ScreenPressor;
	public static var test:Tester;
	public static var MyClass:MyClass;

	static function main() {
		trace('Main.main() :: ${App.NAME} :: ${App.BUILD} - 333');
		// var my = new MyClass(10, 'hello');
		// my.incrementX();
		// my.x = 20;
		// trace(my.x);
	}

	public static function DecompressI(width:Int, height:Int):Void {
		trace('DecompressI( width: $width, height: $height)');
		SP = (SP == null) ? new ScreenPressor(width, height) : SP;
		SP.DecompressI();
	}
}
