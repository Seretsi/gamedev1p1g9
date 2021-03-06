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
	
    public function new(?X:Float = 0, ?Y:Float = 0) {
		super(X, Y);
		atlas = FlxAtlasFrames.fromTexturePackerJson("assets/images/shopper2.png", "assets/data/shopper2.json");
		frames = atlas;
		animation.addByPrefix("up", "s2b", 15);
		animation.addByPrefix("down", "s2f", 15);
		setGraphicSize(0, 150);
		updateHitbox();

    }
	
	override public function update(elapsed:Float):Void {
		if (path != null) {
			if (path.nodes[path.nodeIndex].y < getPosition().y) {
				animation.play("down");
			} else if (path.nodes[path.nodeIndex].y > getPosition().y) {
				animation.play("up");
			}
		}
		super.update(elapsed);
	}
 }