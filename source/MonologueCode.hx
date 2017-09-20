package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.FlxG;

class MonologueCode extends FlxState {
	var displayText:String;
	var textItem:FlxText;
	var textTimer:FlxTimer;
	var advance:Bool;
	var textColor:FlxColor;
	
	override public function create():Void {
		super.create();
		textTimer = new FlxTimer();
		textTimer.active = false;
		displayText = "[insert monologue here]";
		textItem = new FlxText(0, 10, 640, displayText);
		textColor = FlxColor.WHITE;
		textItem.setFormat("Verdana", 14, textColor, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		add(textItem);
		bgColor = FlxColor.WHITE;
	}
	
	override public function update(elapsed:Float):Void {
		advance = FlxG.keys.anyPressed([SPACE]);
		if (advance) {
			if (textColor == FlxColor.WHITE) {
				textColor = FlxColor.BLACK;
				textItem.setFormat("Verdana", 14, textColor, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
			}
			else {
				textColor = FlxColor.WHITE;
				textItem.setFormat("Verdana", 14, textColor, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
			}
		}
	}
}
