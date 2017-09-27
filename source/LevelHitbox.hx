package;

import flixel.FlxSprite;
import flixel.FlxG;

// If something is a hack but it works, is it really a hack?
// Yes. Yes it is.

class LevelHitbox extends FlxSprite
{	
	var x_pos:Float;
	var y_pos:Float;
	
	public function new(X:Float=0, Y:Float=0, W:Int=0, H:Int=0)	{
		super(X, Y);
		x_pos = X;
		y_pos = Y;
		loadGraphic("assets/images/player.png");
		alpha = 1;
		setGraphicSize(W, H);
		updateHitbox();
	}
	
	override public function update(elapsed:Float):Void {
		setPosition(x_pos, y_pos);
	}
}