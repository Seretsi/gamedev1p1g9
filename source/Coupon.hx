package;

import flixel.FlxG;
import flixel.FlxSprite;

class Coupon extends FlxSprite
{
	var scoreValue : Int;
	var collectSoundName : String;
	
	// TODO: Add graphic
	public function new(?X:Float=0, ?Y:Float=0, value:Int = 50)	{
		super(X,Y);
		loadGraphic("assets/art-refined/coupon.png");
		setGraphicSize(70, 0);
		scoreValue = value;
		//collectSoundName = "kaboom";
	}
	
	public function getValue():Int	{
		return scoreValue;
	}
	
	override public function update(elapsed:Float):Void	{
		super.update(elapsed);
	}
	
	/*public override function destroy():Void	{
		FlxG.sound.play(collectSoundName);
		super.destroy();
	}*/
}