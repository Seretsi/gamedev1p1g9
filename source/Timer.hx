package;
import flash.desktop.Clipboard;
import flixel.text.FlxText;

//Current idea is to have each State make its own timer, so that we can have different starting times for each stage.
class Timer extends FlxText
{
	// TODO: Add necessary variables and code for displaying timer text.
	var time : Float;
	
	// Super constructor has a bunch of parameters, but idk if we need them at the moment.
	public function new(startTime:Float)
	{
		super();
		time = startTime;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		time = time - elapsed;
		// TODO: Add code to update display text.
		
		if (time <= 0)
		{
			time = 0;
			// TODO: Call whatever needs to be called when time runs out.
		}
	}
	
	// To be called whenever time is deducted as a penalty - subject to change depending on final decision.
	public function deductTime(penalty:Float):Void
	{
		time -= penalty;
	}
}