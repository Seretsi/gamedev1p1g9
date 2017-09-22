package;

import flixel.FlxState;
import flixel.util.FlxColor;

class LevelOneState extends FlxState {
	var ui:UIFunctions;
	
	override public function create():Void {
		super.create();
		bgColor = FlxColor.WHITE;
		ui = new UIFunctions();
		add(ui.getMonologueItem());
		add(ui.getInteractItem());
		add(ui.getCouponsItem());
		add(ui.getScoreItem());
		add(ui.getTimerItem());
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		ui.updateUI();
		/*if (CRASH) {
			ui.setInteractText(1);
			ui.setMonologueText(1, LEVELNUM);
		}
		if (COUPON)
		{
			ui.setInteractText(2);
			ui.setMonologueText(2, LEVELNUM);
		}
		*/
	}
}
