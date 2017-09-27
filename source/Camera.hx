package;

import flixel.FlxG;
import flixel.tile.FlxTilemap;
import flixel.FlxSprite;
import flixel.FlxCamera;
import flixel.util.FlxColor;

class Camera extends FlxCamera{
	var _target:FlxSprite;
	var _map:FlxTilemap;

	override public function new():Void	{
		super();
		//TODO: setScrollBounds with map object data
		//setScrollBounds(0, _map.width, 0, _map.height);
		//var ext = 50;
        //FlxG.camera.setSize(FlxG.width + ext, FlxG.height + ext);
        //FlxG.camera.setPosition( - ext / 2, - ext / 2);

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

	public function useThisCamera(){ FlxG.camera = this; }
	
	public function setTarget(tar:FlxSprite):Void {
		_target = tar;
		follow(target, TOPDOWN, 10);
	}

	//camera effects for collision events. Place in update function of level.
	public function collisionResponse():Void {
		var duration:Float = 0.1;
		super.shake(0.01, 0.01);
		super.flash(0xFFFF0000, duration); //flash the screen a red colour
		//other colours include, black - 0xFF000000, white - 0xFFFFFFF

	}

	public function gameOver():Void{
		var duration:Int = 1;
		bgColor = FlxColor.ORANGE;
	}

	public function gameOverTransition():Void{
	var duration:Int = 1;
	fade(FlxColor.ORANGE, duration, false, endGame, false);
	}

	private function endGame():Void{ FlxG.switchState(new GameOverState(1)); }
}