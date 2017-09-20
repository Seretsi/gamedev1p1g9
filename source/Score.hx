package;
import flash.desktop.Clipboard;
import flixel.text.FlxText;

class Score extends FlxText
{
	// TODO: Add necessary variables and code for displaying score text.
	var score : Int;
	
	// Super constructor has a bunch of parameters, but idk if we need them at the moment.
	public function new(startBalance:Int=0)
	{
		super();
		score = startBalance;
	}
	
	// Public function so other scripts can call it to change score
	public function addPoints(points:Int):Void
	{
		score = score + points;
	}
}