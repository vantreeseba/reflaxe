package;

@:native("MyNativeClass")
class MyClass {
	@:native("nativeMain")
	public static function main() {
		trace("Hello world.");

		var strLen = "string object".length;
		trace(strLen);

		untyped __testscript__("{0} *** {1}", 2 + 2, "Hello");

		trace(new ShadowCtor(1, 2).sum());
	}

	public static function testMod(): Int {
		return 0;
	}
}

// Regression test for de-shadowing of constructor parameters that share a name
// with an instance field. When one parameter name is a prefix of another
// (`input` / `input2`), each must map to a distinct identifier.
class ShadowCtor {
	var input: Int;
	var input2: Int;

	public function new(input: Int, input2: Int) {
		this.input = input;
		this.input2 = input2;
	}

	public function sum(): Int {
		return input + input2;
	}
}
