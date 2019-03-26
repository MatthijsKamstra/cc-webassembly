package;

class ScreenPressor {
	public function new(width:Int, height:Int) {
		trace('constructor ScreenPressor ($width, $height)');
	}

	public function ReinitTabs():Void {
		trace('ReinitTabs()');
	}

	public function DecompressI():Void {
		trace('DecompressI()');
	}

	public function DecompressFrame():Void {
		trace('DecompressFrame()');
	}
}
