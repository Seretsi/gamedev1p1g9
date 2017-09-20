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
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		
		// Check for collision.
		// On Collision, call collection
	}
	
	// Function to be called when the coupon is collected.
	function collection():Void
	{
		// TODO: Add to score.
		
		destroy();
	}
}