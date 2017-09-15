package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;

class SplashScreenState extends FlxState{
	var _title = new FlxSprite( 275, 150);

	override public function create():Void{
		super.create();
		_title.loadGraphic("assets/images/SplashScreenGameTitle_Placeholder.png", true, 248, 150);
		add(_title);
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}

	function clickPlay():Void{
		FlxG.switchState(new MenuState());
	}
}