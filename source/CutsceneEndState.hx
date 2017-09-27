package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.FlxG;

class CutsceneEndState extends FlxState {
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
		displayText = "I don't know what's real anymore.";
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
				textItem.alpha = 1;
				textItem.text = " - Re-Coupon - ";
			}
		}
		advance = FlxG.keys.anyPressed([SPACE]) || FlxG.mouse.justPressed;
		if (advance == true) {
			position++;
			if (position == 1) {
				displayText = "I gaze upon my husband and see nothing but coupons.";
				textTimer.active = true;
				textTimer.start(3.5);
			}
			else if (position == 2) {
				displayText = "I look and the mirror and see that I am coupons.";
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
