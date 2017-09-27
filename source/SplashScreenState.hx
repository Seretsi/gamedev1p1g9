package;

import flixel.FlxG;
import flixel.FlxState;
import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.ui.FlxButton;

class SplashScreenState extends FlxState{
	// params set location of title draw. Will need to change according to resolution of actual title Sprite
	var _title = new FlxSprite( 275, 150); 
	//button needed to be initialized in the create() function to avoid issues
	var _anyKeyButton:FlxButton;

	override public function create():Void{
		super.create();
		_title.loadGraphic("assets/images/SplashScreenGameTitle_Placeholder.png", true, 248, 150);
		_anyKeyButton  = new FlxButton(10, 10, "press any key", clickPlay);
		_anyKeyButton.x = 360;
		_anyKeyButton.y = 325;

		//add objects to render list
		add(_title);
		add(_anyKeyButton);
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}

	function clickPlay():Void{
		FlxG.switchState(new LevelOneState()); // we may not have a menu and just jump straight into the game
	}
}