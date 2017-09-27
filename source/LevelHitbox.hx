package;

import flixel.FlxSprite;
import flixel.FlxG;

// If something is a hack but it works, is it really a hack?
// Yes. Yes it is.

class LevelHitbox extends FlxSprite
{	
	public function new(X:Float=0, Y:Float=0, W:Int=0, H:Int=0)	{
		super(X,Y);
		setGraphicSize(W, H);
	}
}