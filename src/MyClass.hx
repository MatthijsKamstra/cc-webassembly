package;

class MyClass {
	@:isVar public var x(get, set):Int;
	@:isVar public var y(get, set):String;

	public function new(x:Int, ?y:String) {
		this.x = x;
		trace('MyClass $x');
		// this.y = y;
	}

	public function incrementX() {
		++x;
	}

	public static function getStringFromInstance() {
		// return '[MyClass]';
		trace('[MyClass]');
	}

	// public static function GetStringFromInstance() {
	//
	// }
	// ____________________________________ getter/setter ____________________________________
	function get_x():Int {
		return x;
	}

	function set_x(value:Int):Int {
		return x = value;
	}

	function get_y():String {
		return y;
	}

	function set_y(value:String):String {
		return y = value;
	}
}
