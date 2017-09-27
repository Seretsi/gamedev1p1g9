package;

import flixel.graphics.frames.FlxAtlasFrames;
import flixel.FlxSprite;

/**
 * Shopper 1
 * RIP Object-Oriented Programming
 */

 class Shopper2 extends FlxSprite {
	 
	var speed:Float = 200;
	 
	var atlas:FlxAtlasFrames;
	
    public function new(?X:Float=0, ?Y:Float=0) {
		atlas = FlxAtlasFrames.fromTexturePackerJson("assets/images/shopper2.png", "assets/data/shopper2.json");
		animation.addByPrefix("up", "s2b", 15);
		animation.addByPrefix("down", "s2f", 15);
    }
	
	override public function update(elapsed:Float):Void {
		
	}
 }