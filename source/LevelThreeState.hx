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

class LevelThreeState extends FlxState {
	var ui:UIFunctions;
	var player:Player = new Player(655, 400);
	var transition:TransparentPlate = new TransparentPlate(655, 450);
	var _map:FlxOgmoLoader;
	var _mWalls:FlxTilemap;
	var cam:Camera = new Camera();
	var _bg = new FlxSprite( 1, 1);
	private var numCoups:Int = 5;
	private var coupsHad:Int = 0;
	private var canLeave:Bool = false; 
	var _coupon1:Coupon = new Coupon(500, 105);
	var _coupon2:Coupon = new Coupon(350, 425);
	var _coupon3:Coupon = new Coupon(50, 455);
	var _coupon4:Coupon = new Coupon(5, 5);
	var _coupon5:Coupon = new Coupon(205, 50);
	var _npc1:Shopper1 = new Shopper1(450, 325);
	var npc1path = new FlxPath();
	var path1Points:Array<FlxPoint> = [new FlxPoint(655, 325), new FlxPoint(655, 175)];
	var _npc2:Shopper2 = new Shopper2(575, 460);
	var npc2path = new FlxPath();
	var path2Points:Array<FlxPoint> = [new FlxPoint(575, 460), new FlxPoint(575, 300)];
	var _npc3:Shopper3 = new Shopper3(200, 175);
	var npc3path = new FlxPath();
	var path3Points:Array<FlxPoint> = [new FlxPoint(200, 175), new FlxPoint(575, 175)];
	var _npc4:Shopper3 = new Shopper3(125, 375);
	var npc4path = new FlxPath();
	var path4Points:Array<FlxPoint> = [new FlxPoint(125, 375), new FlxPoint(380, 375)];
	var startPoint:FlxPoint = new FlxPoint(655, 400);


	override public function create():Void {
		//cam.setTarget(player);
		//FlxG.camera = cam;
		super.create();
		bgColor = FlxColor.WHITE;
		ui = new UIFunctions(90, 3);
		add(transition);
		_bg.loadGraphic("assets/art-refined/lv3.png", true, 4000, 3000);
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
		add(_coupon5);
		
		add(_npc1);
		add(_npc2);
		add(_npc3);
		add(_npc4);
		
		_npc1.path = npc1path.add(655, 325).add(655, 175).add(655, 325).start(50, FlxPath.YOYO);
		for (i in 1...29){npc1path.add(655, 325).add(655, 175).add(655, 325).start(50, FlxPath.YOYO); }
		_npc2.path = npc2path.add(575, 460).add(575, 300).add(575, 460).start(50, FlxPath.YOYO);
		for (i in 1...29){npc2path.add(575, 460).add(575, 300).add(575, 460).start(50, FlxPath.YOYO); }
		_npc3.path = npc3path.add(200, 175).add(575, 175).add(200, 175).start(50, FlxPath.YOYO);
		for (i in 1...29){npc3path.add(200, 175).add(575, 175).add(200, 175).start(50, FlxPath.YOYO); }
		_npc4.path = npc3path.add(125, 375).add(380, 375).add(125, 375).start(50, FlxPath.YOYO);
		for (i in 1...29){npc3path.add(125, 375).add(380, 375).add(125, 375).start(50, FlxPath.YOYO); }
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		ui.updateUI(elapsed);
		FlxG.overlap(player, _coupon1, onCoupCollision);
		FlxG.overlap(player, _coupon2, onCoupCollision);
		FlxG.overlap(player, _coupon3, onCoupCollision);
		FlxG.overlap(player, _coupon4, onCoupCollision);
		FlxG.overlap(player, _coupon5, onCoupCollision);
		FlxG.overlap(player, transition, onTransPlate);
		FlxG.collide(player, _npc1, onNPC1Collision);
		FlxG.collide(player, _npc2, onNPC2Collision);
		FlxG.collide(player, _npc3, onNPC3Collision);
		FlxG.collide(player, _npc4, onNPC3Collision);
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
			transition.transition3();
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