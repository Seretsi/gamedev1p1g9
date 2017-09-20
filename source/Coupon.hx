package;

import flixel.FlxG;
import flixel.FlxSprite;

class Coupon extends FlxSprite
{
	var scoreValue : Int;
	
	// TODO: Add graphic
	public function new(value:Int = 50)
	{
		super();
		scoreValue = value;
	}
	
	public function getValue():Int
	{
		return scoreValue;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		// Check for collision.
		// On Collision, call collection
	}
	
	// Function to be called when the coupon is collected.
	// I moved the stuff that would need to be in here to Score, so this can be deleted probably
/*	function collection():Void
	{
		// TODO: Add to score.
		
		destroy();
	}*/
}