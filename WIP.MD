# WIP

For now it works with statics. But otherwise I can't get it to work with Haxe target CPP, it doesn't work on other function  or properties

## goal

To get this example to work with Haxe
Source: <https://emscripten.org/docs/porting/connecting_cpp_and_javascript/embind.html#classes>

```cpp
class MyClass {
public:
	MyClass(int x, std::string y)
		: x(x)
		, y(y)
	{}

	void incrementX() {
		++x;
	}

	int getX() const { return x; }
	void setX(int x_) { x = x_; }

	static std::string getStringFromInstance(const MyClass& instance) {
		return instance.y;
	}

	private:
		int x;
		std::string y;
	};

// Binding code
EMSCRIPTEN_BINDINGS(my_class_example) {
	class_<MyClass>("MyClass")
		.constructor<int, std::string>()
		.function("incrementX", &MyClass::incrementX)
		.property("x", &MyClass::getX, &MyClass::setX)
		.class_function("getStringFromInstance", &MyClass::getStringFromInstance)
		;
}
```

So we can use this code in JavaScript

```js
var instance = new Module.MyClass(10, "hello");
instance.incrementX();
instance.x; // 11
instance.x = 20; // 20
Module.MyClass.getStringFromInstance(instance); // "hello"
instance.delete();
```

## what works with Haxe

```haxe

package;

import Test;

@:buildXml("
<linker id='exe' exe='emcc'>
	<flag value='-s' />
	<flag value='WASM=1' />
	<flag value='--bind' />
</linker>
")
@:cppFileCode('
#include <emscripten/bind.h>
using namespace emscripten;

EMSCRIPTEN_BINDINGS(my_module) {
	class_<Main>("MyWrapper")
	.class_function("test", &Main_obj::TestWrapper);
}
')
class Main {

	static var test : Test;

	static function main() {
		trace("Hello, world!");
	}

	public static function TestWrapper(width:Int,?height:Int = 0):Void {
		trace('TestWrapper( width: $width, height: $height)');
		test = (test == null) ? new Test(width, height) : test;
		test.something();
	}
}
```

```haxe
package;

class Test {
	public function new (width:Int, height:Int) {
		trace('	Test ( width: $width, height: $height)');
	}
	public function something(){
		trace('something');
	}
}
```

What I now know:

- `?height:Int = 0` is not possible: its converted to a `Dynamic` and emscript doesn't recognize this type ([readmore](https://emscripten.org/docs/porting/connecting_cpp_and_javascript/embind.html#built-in-type-conversions))
- `height:Int = 0` is not possible: its converted to a `hx::Null< int >` and emscript doesn't recognize this type ([readmore](https://emscripten.org/docs/porting/connecting_cpp_and_javascript/embind.html#built-in-type-conversions))
