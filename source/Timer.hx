package;

import flixel.FlxG;
import flash.desktop.Clipboard;
import flixel.text.FlxText;

//Current idea is to have each State make its own timer, so that we can have different starting times for each stage.
class GameTimer extends FlxText
{
	// TODO: Add necessary variables and code for displaying timer text.
	var time : Float;
	var _stop : Bool = false;
	
	// Super constructor has a bunch of parameters, but idk if we need them at the moment.
	public function new(startTime:Float)
	{
		super();
		time = startTime;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (_stop)
			return;
		time = time - elapsed;
		
		if (time <= 0)
		{
			time = 0;
			// TODO: Call whatever needs to be called when time runs out - probably just use FlxG to switch to game over state.
		}
	}
	
	// Returns the time rounded down to the second (drops milliseconds and stuff).
	public function getTime():Int
	{
		return Std.int(time);
	}
	
	// To be called whenever time is deducted as a penalty - subject to change depending on final decision.
	public function deductTime(penalty:Float = 15):Void
	{
		time -= penalty;
	}
	
	// For the end of the level - stops the timer and returns the player's ending time for the sake of score calculation.
	public function finalTime():Float
	{
		_stop = true;
		return time;
	}
}