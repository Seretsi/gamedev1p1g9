package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.FlxG;

class GameOverState extends FlxState
{
	var _gameOverString:String;
	var _gameOverTxt:FlxText;
	var _textColor:FlxColor;
	var _cam:Camera = new Camera();

	override public function create():Void
	{
		super.create();
		_cam.gameOver();
		_gameOverTxt.screenCenter();
		add(_gameOverTxt);
		
	}
	
	override public function update(elapsed:Float):Void
	{

	}
}
