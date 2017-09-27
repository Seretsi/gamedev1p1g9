package;

import flixel.FlxState;
import flixel.util.FlxColor;

class LevelThreeState extends FlxState {
	var ui:UIFunctions;
	
	override public function create():Void {
		super.create();
		bgColor = FlxColor.BLACK;
		var levelTime:Float = 10;
		ui = new UIFunctions(10, 1);
		add(ui.getMonologueItem());
		add(ui.getInteractItem());
		add(ui.getCouponsItem());
		add(ui.getScoresItem());
		add(ui.getTimerItem());
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		ui.updateUI(elapsed);
		/*if (CRASH) {
			ui.setInteractText(1);
			ui.setMonologueText(1, 1);
		}
		if (COUPON)
		{
			ui.setInteractText(2);
			ui.setMonologueText(2, 1);
		}
		*/
	}
}
