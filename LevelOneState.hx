package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.util.FlxCollision;

class LevelOneState extends FlxState {
	private var _player:Player;
	private var numCoups:Int = 5;
	private var coupsHad:Int = 0;
	private var canLeave:Bool = false;
	var _coupon1:Coupon;
	var ui:UIFunctions;
	
	override public function create():Void {
		super.create();
		
		_player = new Player(20, 20);
		add(_player);
		_coupon1 = new Coupon(200, 200);
		add(_coupon1);
		
		bgColor = FlxColor.WHITE;
		ui = new UIFunctions(10);
		
		
		add(ui.getMonologueItem());
		add(ui.getInteractItem());
		add(ui.getCouponsItem());
		add(ui.getScoresItem());
		add(ui.getTimerItem());
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		ui.updateUI(elapsed);
		
		FlxG.overlap(_player, _coupon1, onCoupCollision);
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
	
	private function onCoupCollision(player:Player, coupon:Coupon){
		if (coupon.exists && player.exists){
			//FlxG.sound.play(collectSoundName);
			coupon.destroy();
			coupsHad++;
			if (coupsHad >= numCoups){canLeave = true;}
		}
	}
}
