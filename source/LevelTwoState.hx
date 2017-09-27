package;

import flixel.FlxState;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.util.FlxCollision;
import flixel.math.FlxPoint;
import flixel.util.FlxPath;

class LevelTwoState extends FlxState {
	var ui:UIFunctions;
	var player:Player = new Player(655, 225);
	var transition:TransparentPlate = new TransparentPlate(675, 495);
	var _map:FlxOgmoLoader;
	var _mWalls:FlxTilemap;
	var cam:Camera = new Camera();
	var _bg = new FlxSprite( 1, 1);
	private var numCoups:Int = 4;
	private var coupsHad:Int = 0;
	private var canLeave:Bool = false; 
	var _coupon1:Coupon = new Coupon(300, 305);
	var _coupon2:Coupon = new Coupon(350, 500);
	var _coupon3:Coupon = new Coupon(50, 470);
	var _coupon4:Coupon = new Coupon(5, 25);
	var _npc1:Shopper1 = new Shopper1(450, 325);
	var npc1path = new FlxPath();
	var path1Points:Array<FlxPoint> = [new FlxPoint(450, 325), new FlxPoint(450, 175)];
	var _npc2:Shopper3 = new Shopper3(100, 560);
	var npc2path = new FlxPath();
	var path2Points:Array<FlxPoint> = [new FlxPoint(100, 460), new FlxPoint(600, 460)];
	var _npc3:Shopper2 = new Shopper2(100, 360);
	var npc3path = new FlxPath();
	var path3Points:Array<FlxPoint> = [new FlxPoint(100, 360), new FlxPoint(100, 160)];
	var _npc4:Shopper3 = new Shopper3(320, 240);
	var npc4path = new FlxPath();
	var path4Points:Array<FlxPoint> = [new FlxPoint(320, 240), new FlxPoint(460, 240)];
	var _npc5:Shopper1 = new Shopper1(600, 275);
	var npc5path = new FlxPath();
	var path5Points:Array<FlxPoint> = [new FlxPoint(600, 275), new FlxPoint(600, 50)];
	var startPoint:FlxPoint = new FlxPoint(655, 225);

	override public function create():Void {
		cam.setTarget(player);
		//FlxG.camera = cam;
		super.create();
		bgColor = FlxColor.WHITE;
		ui = new UIFunctions(90, 2);
		add(transition);
		_bg.loadGraphic("assets/art-refined/lv2.png", true, 3200, 2400);
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
		add(_coupon4);
		
		add(_npc1);
		add(_npc2);
		add(_npc3);
		add(_npc4);
		add(_npc5);
		
		_npc1.path = npc1path.add(450, 325).add(450, 175).add(450, 325).start(50, FlxPath.YOYO);
		for (i in 1...29){npc1path.add(450, 325).add(450, 175).add(450, 325).start(50, FlxPath.YOYO); }
		_npc2.path = npc2path.add(100, 460).add(600, 460).add(100, 460).start(50, FlxPath.YOYO);
		for (i in 1...29){npc2path.add(100, 460).add(600, 460).add(100, 460).start(50, FlxPath.YOYO); }
		_npc3.path = npc3path.add(100, 360).add(100, 160).add(100, 360).start(50, FlxPath.YOYO);
		for (i in 1...29){npc3path.add(100, 360).add(100, 160).add(100, 360).start(50, FlxPath.YOYO); }
		_npc4.path = npc4path.add(320, 240).add(460, 240).add(320, 240).start(50, FlxPath.YOYO);
		for (i in 1...29){npc4path.add(320, 240).add(460, 240).add(320, 240).start(50, FlxPath.YOYO); }
		_npc5.path = npc5path.add(600, 275).add(600, 50).add(600, 275).start(50, FlxPath.YOYO);
		for(i in 1...29){npc4path.add(600, 275).add(600, 50).add(600, 275).start(50, FlxPath.YOYO);}	
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		ui.updateUI(elapsed);
		var x:Int, y:Int;
		x = player.getPosition().x, y = player.getPosition().y;
		if (x < 0) {
			player.setPosition(0, y);
		} else if (x > 800) {
			player.setPosition(800, y);
		}
		if (y < 0) {
			player.setPosition(x, 0);
		} else if (y > 600) {
			player.setPosition(x, 600);
		}
		FlxG.overlap(player, _coupon1, onCoupCollision);
		FlxG.overlap(player, _coupon2, onCoupCollision);
		FlxG.overlap(player, _coupon3, onCoupCollision);
		FlxG.overlap(player, _coupon4, onCoupCollision);
		FlxG.overlap(player, transition, onTransPlate);
		FlxG.collide(player, _npc1, onNPC1Collision);
		FlxG.collide(player, _npc2, onNPC3Collision);
		FlxG.collide(player, _npc3, onNPC2Collision);
		FlxG.collide(player, _npc4, onNPC3Collision);
		FlxG.collide(player, _npc5, onNPC1Collision);
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
	
	private function onTransPlate(player:Player, transition:TransparentPlate){
		if (canLeave){
			transition.transition2();
		}
	}
	
	private function onNPC1Collision(player:Player, npc:Shopper1){
		FlxObject.separate(player, npc);
		player.setPosition(startPoint.x, startPoint.y);
		
		ui.reduceTimer();
		ui.setInteractText(1);
		ui.setMonologueText(1);	
		collisionResponse();
	}
	
	private function onNPC2Collision(player:Player, npc:Shopper2){
		FlxObject.separate(player, npc);
		player.setPosition(startPoint.x, startPoint.y);
		ui.reduceTimer();
		ui.setInteractText(1);
		ui.setMonologueText(1);	
		collisionResponse();
	}
	
	private function onNPC3Collision(player:Player, npc:Shopper3){
		FlxObject.separate(player, npc);
		player.setPosition(startPoint.x, startPoint.y);
		ui.reduceTimer();
		ui.setInteractText(1);
		ui.setMonologueText(1);
		collisionResponse();	
	}

	private function collisionResponse():Void {
		var duration:Float = 0.1;
		FlxG.camera.shake(0.01, 0.1);
		FlxG.camera.flash(0xFFFF0000, duration); //flash the screen a red colour
		//other colours include, black - 0xFF000000, white - 0xFFFFFFF
	}
}