package;


import flixel.graphics.frames.FlxAtlasFrames;
import flixel.system.FlxSound;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.math.FlxPoint;
import flixel.FlxObject;
 
import flixel.util.FlxColor;

/**
 * @author Becca Sheridan & Etienne Morakotkarn
 */

 class Player extends FlxSprite {
	 
	var speed:Float = 200;
	var _up:Bool = false;
	var _down:Bool = false;
	var _right:Bool = false;
	var _left:Bool = false;
	var WIDTH:Int = 300;
	var HEIGHT:Int = 700;
	 
	var atlas:FlxAtlasFrames;
//	var cartStart:FlxSound;
	var cartLoop:FlxSound;
	/*var frontBack:FlxAtlasFrames;
	var b45:FlxAtlasFrames;
	var l45:FlxAtlasFrames;
	var r45:FlxAtlasFrames;
	var left:FlxAtlasFrames;*/
	
    public function new(?X:Float=0, ?Y:Float=0) {
        super(X, Y);
		atlas = FlxAtlasFrames.fromTexturePackerJson("assets/images/player.png", "assets/data/player.json");
		frames = atlas;
		animation.addByPrefix("left", "l(", 15);
		animation.addByPrefix("up", "b(", 15);
		animation.addByPrefix("down", "f(", 15);
		animation.addByPrefix("l45", "l45", 15);
		animation.addByPrefix("r45", "r45", 15);
		animation.addByPrefix("b45", "b45", 15);
		setGraphicSize(0, 150);
		setFacingFlip(FlxObject.LEFT, false, false);
		setFacingFlip(FlxObject.RIGHT, true, false);
		cartLoop = FlxG.sound.load("assets/sounds/cartStartNew.wav", 0.5, true);
//		cartStart = FlxG.sound.load("assets/sounds/cartStart.wav", 0.5, false, false, false, cartLoop.play());
		drag.x = drag.y = 1600;
    }
	
	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		poll();
		movement();
		animate();
		cartLoop.play();
		updateHitbox();
	}
	
	function poll():Void {
		_up = FlxG.keys.anyPressed([UP, W]);
		_down = FlxG.keys.anyPressed([DOWN, S]);
		_right = FlxG.keys.anyPressed([RIGHT, D]);
		_left = FlxG.keys.anyPressed([LEFT, A]);
	}
	
	function movement():Void {
		if (_up && _down){
			_up = _down = false;
		}
		if (_right && _left){
			_right = _left = false;
		}
		
		if (_up || _down || _left || _right){
			velocity.x = speed;
			velocity.y = speed;
			var mA:Float = 0;
			if (_up){
				mA =-90;
				if (_left){
					mA -= 45;
				} else if (_right){
					mA += 45;
				}
			} else if (_down){
				mA = 90;
				if (_left){
					mA += 45;
					facing = FlxObject.LEFT;
				} else if (_right){
					mA -= 45;
				}
			} else if (_left){
				mA = 180;
			} else if (_right){
				mA = 0;
			}
			mA -= 20;
			velocity.set(speed, 0);
			velocity.rotate(FlxPoint.weak(0, 0), mA);
		}
	}
	
	function animate():Void
	{
		if (_right && !_down) {
			facing = FlxObject.RIGHT;
		} else if (_left || _up || _down || _right) {
			facing = FlxObject.LEFT;
		}
		
		if (_up) {
			if (_left) {
				animation.play("b45");
			}
			else if (_right)  {
				animation.play("b45");
			}
			else {
				animation.play("up");
			}
		} else if (_down) {
			if (_left) {
				animation.play("l45");
			} else if (_right) {
				animation.play("r45");
			} else {
				animation.play("down");
			}
		} else if (_left) {
			animation.play("left");
		} else if (_right) {
			animation.play("left");
		} else {
			animation.stop();
		}
		setGraphicSize(0, 150);
	}
 }