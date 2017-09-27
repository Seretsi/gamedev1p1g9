package;

import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.FlxSprite;

class LevelOneState extends FlxState {
	var ui:UIFunctions;
	var player:Player = new Player();
	var _map:FlxOgmoLoader;
	var _mWalls:FlxTilemap;
	var cam:Camera = new Camera();
	var _bg = new FlxSprite( 1, 1); 

	override public function create():Void {
		cam.setTarget(player);
		FlxG.camera = cam;
		super.create();
		bgColor = FlxColor.WHITE;
		ui = new UIFunctions(10);
		
		_bg.loadGraphic("assets/art-refined/lv1.png", true, 3200, 2400);
		_bg.setGraphicSize(800);
		_bg.screenCenter();
		add(_bg);

		_map = new FlxOgmoLoader(AssetPaths.levelOneCollisions_oel);
		_mWalls = _map.loadTilemap(AssetPaths.tiles__png, 16, 16, "walls");
		_mWalls.follow();
		/*	_mWalls.setTileProperties(1, FlxObject.NONE);
		_mWalls.setTileProperties(2, FlxObject.ANY);
		add(_mWalls);
		*/
		add(player);
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