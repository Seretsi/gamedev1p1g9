package;

import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxSprite;

/**
 * Shopper 1
 * RIP Object-Oriented Programming
 */

 class Shopper1 extends FlxSprite {
	 
	var speed:Float = 200;
	 
	var atlas:FlxAtlasFrames;
	
    public function new(?X:Float=0, ?Y:Float=0) {
		
    }
	
	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		poll();
		movement();
		animate();
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
		if (_up || _left || _right || _down) {
			FlxG.log.add("POTATOES");
			cartLoop.play();
		} else {
			cartLoop.stop();
		}
		
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