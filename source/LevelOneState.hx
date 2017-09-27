package;

import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.util.FlxCollision;

class LevelOneState extends FlxState {
	var ui:UIFunctions;
	var player:Player = new Player(100,175);
	var _map:FlxOgmoLoader;
	var _mWalls:FlxTilemap;
	var cam:Camera = new Camera();
	var _bg = new FlxSprite( 1, 1);
	private var numCoups:Int = 3;
	private var coupsHad:Int = 0;
	private var canLeave:Bool = false; 
	var _coupon1:Coupon = new Coupon(300, 100);
	var _coupon2:Coupon = new Coupon(650, 375);
	var _coupon3:Coupon = new Coupon(350, 500);

	override public function create():Void {
		cam.setTarget(player);
		FlxG.camera = cam;
		super.create();
		bgColor = FlxColor.WHITE;
		ui = new UIFunctions(10,1);
		
		_bg.loadGraphic("assets/art-refined/lv1.png", true, 3200, 2400);
		_bg.setGraphicSize(800);
		_bg.screenCenter();
		add(_bg);

		_map = new FlxOgmoLoader("assets/images/levelOneCollisions.oel");
		_mWalls = _map.loadTilemap("assets/art-refined/lv1.png", 100, 100, "walls");
		//_mWalls.loadMapFromGraphic("assets/art-refined/lv1.png", false, 100, null, /*TileGraphic:FlxTilemapGraphicAsset*/null,
										 //100, 100, flixel.tile.FlxBaseTilemap.FlxTilemapAutoTiling.AUTO, 0, 1, 1);
		_mWalls.setTileProperties(1, FlxObject.NONE);
		/*_mWalls.follow();
		*/
		_mWalls.setTileProperties(2, FlxObject.ANY);
		add(player);
		add(_mWalls);
		add(ui.getMonologueItem());
		add(ui.getInteractItem());
		add(ui.getCouponsItem());
		add(ui.getScoresItem());
		add(ui.getTimerItem());
		
		add(_coupon1);
		add(_coupon2);
		add(_coupon3);
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		ui.updateUI(elapsed);
		FlxG.overlap(player, _coupon1, onCoupCollision);
		FlxG.overlap(player, _coupon2, onCoupCollision);
		FlxG.overlap(player, _coupon3, onCoupCollision);
		/*if (CRASH) {
			ui.setInteractText(1);
			ui.setMonologueText(1, 1);
		}
		*/
	}

	private function onCoupCollision(player:Player, coupon:Coupon){
		if (coupon.exists && player.exists){
			//FlxG.sound.play(collectSoundName);
			ui.setCoupons(coupon);
			coupon.destroy();
			coupsHad++;
			ui.setInteractText(2);
			ui.setMonologueText(2);
			if (coupsHad >= numCoups){canLeave = true;}
		}
	}
}