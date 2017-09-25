package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.FlxG;

class CutsceneTwoState extends FlxState {
	var displayText:String;
	var textItem:FlxText;
	var textTimer:FlxTimer;
	var advance:Bool;
	var position:Int;
	var textColor:FlxColor;
	
	override public function create():Void {
		super.create();
		textTimer = new FlxTimer();
		textTimer.active = true;
		textTimer.start(2);
		textTimer.loops = 1;
		displayText = "[insert store name] is selling things at a 100% discount...";
		textItem = new FlxText(0, 220, 640, displayText);
		textColor = FlxColor.WHITE;
		textItem.setFormat("Verdana", 16, textColor, "center");
		add(textItem);
		position = 0;
	}
	
	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		if (position == 0) {
			var transp:Float = textTimer.elapsedTime / 1.5;
			if (transp > 1) {
				textTimer.active = false;
				transp = 1;
			}
			textItem.alpha = transp;
			textItem.setFormat("Verdana", 16, textColor, "center");
		}
		else if(position < 3) {
			if(textTimer.elapsedTime < 1.5) {
				var transp:Float = (textTimer.timeLeft - 2.0) / 1.5;
				textItem.alpha = transp;
			}
			else if (textTimer.elapsedTime >= 1.5) {
				var transp:Float = (textTimer.elapsedTime - 1.5) / 1.5;
				textItem.text = displayText;
				textItem.alpha = transp;
				if(textTimer.elapsedTime > 3.0) {
					textTimer.active = false;
					transp = 1;
				}
			}
		}
		else {
			var transp:Float = (textTimer.timeLeft - 0.5) / 1.5;
			textItem.alpha = transp;
			if(textTimer.elapsedTime > 1.5) {
				textTimer.active = false;
				//FlxG.switchState(new LevelTwoState());
			}
		}
		advance = FlxG.keys.anyPressed([SPACE]) || FlxG.mouse.justPressed;
		if (advance == true) {
			position++;
			if (position == 1) {
				displayText = "...but that discount only applies if you have the right coupons.";
				textTimer.active = true;
				textTimer.start(3.5);
			}
			else if (position == 2) {
				displayText = "You know what that means. It's coupon time.";
				textTimer.active = true;
				textTimer.start(3.5);
			}
			else if (position == 3) {
				textTimer.active = true;
				textTimer.start(2.0);
			}
		}
	}
}
