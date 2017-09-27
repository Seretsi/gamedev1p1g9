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
		animation.addByPrefix("left", "1", 15);
		animation.addByPrefix("right", "1", 15, true, true);
		setGraphicSize(0, 150);
		updateHitbox();
    }
	
	override public function update(elapsed:Float):Void {
		if (path != null) {
			if (path.nodes[path.nodeIndex].x < getPosition().x) {
				animation.play("left");
			} else if (path.nodes[path.nodeIndex].x > getPosition().x) {
				animation.play("right");
			}
		}
		super.update(elapsed);
	}
 }