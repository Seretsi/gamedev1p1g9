package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.FlxG;

class GameOverState extends FlxState
{
	var gameOverString:String;
	var gameOverTxt:FlxText;
	var textColor:FlxColor;
	var cam:Camera = new Camera();

	override public function create():Void
	{
		super.create();
		cam.gameOver();
		gameOverTxt.screenCenter();
		add(gameOverTxt);
		
	}
	
	override public function update(elapsed:Float):Void
	{

	}
}
