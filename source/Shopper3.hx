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
	
    public function new(?X:Float=0, ?Y:Float=0) {
		atlas = FlxAtlasFrames.fromTexturePackerJson("assets/images/shopper2.png", "assets/data/shopper2.json");
		animation.addByPrefix("left", "s3", 15);
		setFacingFlip(FlxObject.LEFT, false, false);
		setFacingFlip(FlxObject.RIGHT, true, false);
    }
	
	override public function update(elapsed:Float):Void {
		
	}
 }