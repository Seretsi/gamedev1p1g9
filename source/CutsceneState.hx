package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.FlxG;

class CutsceneState extends FlxState
{
	var displayText:String;
	var textItem:FlxText;
	var textTimer:FlxTimer;
	var advance:Bool;
	var position:Int;
	
	override public function create():Void
	{
		super.create();
		textTimer = new FlxTimer();
		textTimer.active = false;
		displayText = "temp";
		textItem = new FlxText(0, 220, 640, displayText);
		textItem.setFormat("Verdana", 14, FlxColor.WHITE, "center");
		add(textItem);
		position = 0;
	}
	
	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		if (position == 0)
		{
			
		}
		advance = FlxG.keys.anyPressed([SPACE]) || FlxG.mouse.justPressed;
	}
}
