package;

import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxSprite;
import flixel.FlxObject;

/**
 * Shopper 3
 * RIP Object-Oriented Programming
 */

 class Shopper3 extends FlxSprite {
	 
	var speed:Float = 200;
	 
	var atlas:FlxAtlasFrames;
	
    public function new(?X:Float = 0, ?Y:Float = 0) {
		super(X, Y);
		atlas = FlxAtlasFrames.fromTexturePackerJson("assets/images/shopper3.png", "assets/data/shopper3.json");
		frames = atlas;
		animation.addByPrefix("left", "s3", 15);
		setFacingFlip(FlxObject.LEFT, false, false);
		setFacingFlip(FlxObject.RIGHT, true, false);
    }
	
	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}
 }