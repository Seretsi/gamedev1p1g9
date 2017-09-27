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
import flixel.group.FlxGroup;

class LevelThreeState extends FlxState {
	var hitboxes:FlxGroup;
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
	var _npc1:Shopper1 = new Shopper1(655, 250);
	var npc1path = new FlxPath();
	var path1Points:Array<FlxPoint> = [new FlxPoint(655, 250), new FlxPoint(655, 175)];
	var _npc2:Shopper2 = new Shopper2(525, 460);
	var npc2path = new FlxPath();
	var path2Points:Array<FlxPoint> = [new FlxPoint(525, 460), new FlxPoint(525, 300)];
	var _npc3:Shopper3 = new Shopper3(200, 175);
	var npc3path = new FlxPath();
	var path3Points:Array<FlxPoint> = [new FlxPoint(150, 275), new FlxPoint(500, 275)];
	var startPoint:FlxPoint = new FlxPoint(655, 400);


	override public function create():Void {
		//cam.setTarget(player);
		//FlxG.camera = cam;
		super.create();
		bgColor = FlxColor.BLACK;
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

		hitboxes = new FlxGroup();
		hitboxes.add(new LevelHitbox(Std.int(2800/5), Std.int(1400/5), Std.int((3101 - 2800)/5), Std.int((2997-1400)/5)));
		hitboxes.add(new LevelHitbox(Std.int(177*0.2), Std.int(2817*0.2), Std.int((2869 - 177)*0.2), Std.int((2993-2817)*0.2)));
		hitboxes.add(new LevelHitbox(Std.int(1*0.2), Std.int(945*0.2), Std.int((177 - 1)*0.2), Std.int((2993-945)*0.2)));
		hitboxes.add(new LevelHitbox(Std.int(681*0.2), Std.int(5*0.2), Std.int((3853 - 681)*0.2), Std.int((149-5)*0.2)));
		hitboxes.add(new LevelHitbox(Std.int(3849*0.2), Std.int(5*0.2), Std.int((3993 - 3849)*0.2), Std.int((2181-5)*0.2)));
		hitboxes.add(new LevelHitbox(Std.int(785*0.2), Std.int(925*0.2), Std.int((2065 - 785)*0.2), Std.int((1169-925)*0.2)));
		
		hitboxes.draw();
		add(hitboxes);
		
		add(_coupon1);
		add(_coupon2);
		add(_coupon3);
		add(_coupon4);
		add(_coupon5);
		
		add(_npc1);
		add(_npc2);
		add(_npc3);
		
		_npc1.path = npc1path.add(655, 250).add(655, 175).add(655, 250).start(50, FlxPath.YOYO);
		_npc2.path = npc2path.add(525, 460).add(525, 300).add(525, 460).start(50, FlxPath.YOYO);
		_npc3.path = npc3path.add(150, 275).add(500, 275).add(150, 275).start(50, FlxPath.YOYO);
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		ui.updateUI(elapsed);
		
		var x:Float, y:Float;
		x = player.getPosition().x; 
		y = player.getPosition().y;
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
		FlxG.overlap(player, _coupon5, onCoupCollision);
		FlxG.overlap(player, transition, onTransPlate);
		FlxG.collide(player, _npc1, onNPC1Collision);
		FlxG.collide(player, _npc2, onNPC2Collision);
		FlxG.collide(player, _npc3, onNPC3Collision);
		FlxG.collide(player, hitboxes);
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