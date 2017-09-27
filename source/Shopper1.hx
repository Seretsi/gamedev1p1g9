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
	
    public function new(?X:Float = 0, ?Y:Float = 0) {
		super(X, Y);
		atlas = FlxAtlasFrames.fromTexturePackerJson("assets/images/shopper1.png", "assets/data/shopper1.json");
		frames = atlas;
		animation.addByPrefix("up", "s1b", 15);
		animation.addByPrefix("down", "s1f", 15);
		setGraphicSize(0, 150);
		updateHitbox();
    }
	
	override public function update(elapsed:Float):Void {
		super.update(elapsed);
	}
 }