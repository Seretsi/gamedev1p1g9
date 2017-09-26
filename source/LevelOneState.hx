package;

import flixel.FlxState;
import flixel.util.FlxColor;

class LevelOneState extends FlxState {
	var ui:UIFunctions;
	var el:Float;
	
	override public function create():Void {
		super.create();
		bgColor = FlxColor.BLACK;
		ui = new UIFunctions(10, 1);
		add(ui.getMonologueItem());
		add(ui.getInteractItem());
		add(ui.getCouponsItem());
		add(ui.getScoresItem());
		add(ui.getTimerItem());
		el = 0;
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		ui.updateUI(elapsed);
		el += elapsed;
		if (el > 17 && el < 18)
		{
			el += 10;
			ui.setInteractText(1);
			ui.setMonologueText(1);
		}
		if (el > 5 && el < 6)
		{
			el += 2;
			ui.setInteractText(2);
			ui.setMonologueText(2);
		}
	}
}
