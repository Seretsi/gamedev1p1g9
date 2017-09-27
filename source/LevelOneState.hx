package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.util.FlxCollision;
import flixel.tile.FlxTilemap;
//import flixel.addons.editors.ogmo.FlxOgmoLoader;


class LevelOneState extends FlxState {
	private var player:Player;
	private var numCoups:Int = 5;
	private var coupsHad:Int = 0;
	private var canLeave:Bool = false;
	var _coupon1:Coupon;
	var ui:UIFunctions;
	//var _map:FlxOgmoLoader;
	var _mWalls:FlxTilemap;
	var cam:Camera = new Camera();
	var _bg = new FlxSprite( 1, 1); 
	
	override public function create():Void {
		super.create();
		cam.setTarget(player);
		FlxG.camera = cam;

		player = new Player(20, 20);
		add(player);
		_coupon1 = new Coupon(200, 200);
		add(_coupon1);
		
		bgColor = FlxColor.BLACK;
		ui = new UIFunctions(10, 1);
		_bg.loadGraphic("assets/art-refined/lv1.png", true, 3200, 2400);
		_bg.setGraphicSize(800);
		_bg.screenCenter();
		add(_bg);
		//_map = new FlxOgmoLoader(AssetPaths.levelOneCollisions_oel);
		//_mWalls = _map.loadTilemap(AssetPaths.tiles__png, 16, 16, "walls");
		//_mWalls.follow();
		/*	_mWalls.setTileProperties(1, FlxObject.NONE);
		_mWalls.setTileProperties(2, FlxObject.ANY);
		add(_mWalls);
		*/
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
			ui.setMonologueText(1);
		}
		if (COUPON)
		{
			ui.setInteractText(2);
			ui.setMonologueText(2);
		}
		if(LEVEL END) {
			ui.getEndResults();
			add(ui.getEndHeaderScoreItem());
			add(ui.getEndMoneyScoreItem());
			add(ui.getEndCoupScoreItem());
			add(ui.getEndTimeScoreItem());
			add(ui.getEndTotalScoreItem());
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