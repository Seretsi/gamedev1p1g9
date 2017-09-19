package;

import flixel.FlxG;
import flixel.tile.FlxTilemap;
import flixel.FlxSprite;
import flixel.FlxCamera;

class Camera extends FlxCamera{
	var _target:FlxSprite;
	var _map:FlxTilemap;

	override public function new():Void	{
		super();
		//built in shake, fade, flash a colour (damage visuals), 
		/*public function fade(Color:FlxColor = FlxColor.BLACK, Duration:Float = 1, FadeIn:Bool = false,
								?OnComplete:Void->Void, Force:Bool = false):Void
		public function flash(Color:FlxColor = FlxColor.WHITE, Duration:Float = 1, ?OnComplete:Void->Void,
							Force:Bool = false):Void
		public function shake(Intensity:Float = 0.05, Duration:Float = 0.5, ?OnComplete:Void->Void, Force:Bool = true,
							?Axes:FlxAxes):Void
		use FlxCameraFollowStyle TOPDOWN or TOPDOWN_TIGHT as a start.
		public function follow(Target:FlxObject, ?Style:FlxCameraFollowStyle, ?Lerp:Float):Void
		public function snapToTarget():Void use to snap to target without smoothing
		
		*/

	}

	override public function update(elapsed:Float):Void	{
		super.update(elapsed);
		
	}

	public function setTarget(tar:FlxSprite):Void {
		_target = tar;
		follow(target, TOPDOWN, 10);
		setScrollBounds(0, _map.width, 0, _map.height);

	}

	public function collisionResponse() {
		var duration:Float = 0.1;
		super.shake(0.01, 0.01);
		super.flash(0xFFFF0000, duration); //flash the screen a red colour
		//other colours include, black - 0xFF000000, white - 0xFFFFFFF

	}
}