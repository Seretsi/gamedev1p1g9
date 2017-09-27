package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.FlxG;
import flixel.ui.FlxButton;

class GameOverState extends FlxState
{
	var _gameOverString:String;
	var _gameOverTxt:FlxText;
	var _textColor:FlxColor;
	var _cam:Camera = new Camera();
	var _exitKeyButton:FlxButton;
	var _restartKeyButton:FlxButton;
	var _levelNumber:Int;

	override public function new(x:Int){
		super();
		bgColor = FlxColor.BLACK;
		this._levelNumber = x;
	}
	override public function create():Void
	{
		super.create();
		_cam.gameOver();
		_gameOverTxt = new FlxText(290, 300, 300, "You starved to death and died. Game Over!");
		_exitKeyButton  = new FlxButton(10, 10, "EXIT", returnToSplashScreen);
		_exitKeyButton.x = 300;
		_exitKeyButton.y = 325;
		switch(_levelNumber){
			case 1: 
				_restartKeyButton  = new FlxButton(10, 10, "RETRY", restartLevelOne);
			case 2: 
				_restartKeyButton  = new FlxButton(10, 10, "RETRY", restartLevelTwo);
			case 3: 
				_restartKeyButton  = new FlxButton(10, 10, "RETRY", restartLevelThree);
		}
		//_restartKeyButton  = new FlxButton(10, 10, "RETRY", restartCurrentLevel);
		_restartKeyButton.x = 400;
		_restartKeyButton.y = 325;

		add(_gameOverTxt);
		add(_exitKeyButton);
		add(_restartKeyButton);
		
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
	}

	override public function destroy():Void
	{
		super.destroy(); 
	}
	private function restartLevelOne(){
		FlxG.switchState(new LevelOneState());
	}
	private function restartLevelTwo(){
		FlxG.switchState(new LevelTwoState());
	}
	private function restartLevelThree(){
		FlxG.switchState(new LevelThreeState());
	}
	private function returnToSplashScreen(){
		FlxG.switchState(new SplashScreenState());
	}
}
