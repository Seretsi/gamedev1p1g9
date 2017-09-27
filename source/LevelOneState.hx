package;

import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.util.FlxColor;
import flixel.FlxG;
import flixel.tile.FlxTilemap;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.FlxSprite;
import flixel.FlxObject;
import flixel.util.FlxCollision;
import flixel.math.FlxPoint;
import flixel.util.FlxPath;

class LevelOneState extends FlxState {
	var ui:UIFunctions;
	var hitboxes:FlxGroup;
	var player:Player = new Player(100,175);
	var transition:TransparentPlate = new TransparentPlate(100, 100);
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
	var _npc1:Shopper1 = new Shopper1(450, 325);
	var npc1path = new FlxPath();
	var path1Points:Array<FlxPoint> = [new FlxPoint(450, 325), new FlxPoint(450, 175)];
	var _npc2:Shopper3 = new Shopper3(200, 460);
	var npc2path = new FlxPath();
	var path2Points:Array<FlxPoint> = [new FlxPoint(200, 460), new FlxPoint(600, 460)];

	override public function create():Void {
		FlxG.debugger.drawDebug = true;
		
		cam.setTarget(player);
		FlxG.camera = cam;
		super.create();
		bgColor = FlxColor.WHITE;
		ui = new UIFunctions(90, 1);
		add(transition);
		_bg.loadGraphic("assets/art-refined/lv1.png", true, 3200, 2400);
		_bg.setGraphicSize(800);
		_bg.screenCenter();
		add(_bg);
		add(_npc1);
		add(_npc2);
		_map = new FlxOgmoLoader("assets/images/levelOneCollisions.oel");
		_mWalls = _map.loadTilemap("assets/art-refined/lv1.png", 100, 100, "walls");
		add(player);
		//add(_mWalls);
		add(ui.getMonologueItem());
		add(ui.getInteractItem());
		add(ui.getCouponsItem());
		add(ui.getScoresItem());
		add(ui.getTimerItem());
		
		add(_coupon1);
		add(_coupon2);
		add(_coupon3);
		_npc1.path = npc1path.add(450, 325).add(450, 175).add(450, 325).start(50, FlxPath.FORWARD);
		for (i in 1...29){npc1path.add(450, 325).add(450, 175).add(450, 325).start(50, FlxPath.FORWARD); }
		_npc2.path = npc2path.add(200, 460).add(600, 460).add(200, 460).start(50, FlxPath.FORWARD);
		for(i in 1...29){npc2path.add(200, 460).add(600, 460).add(200, 460).start(50, FlxPath.FORWARD);}	
		hitboxes = new FlxGroup();
		hitboxes.add(new LevelHitbox(220, 0, 800 - 220, 110));
		hitboxes.add(new LevelHitbox(186, 209, 319 - 186, 318 - 835));
		hitboxes.add(new LevelHitbox(586, 189, 718 - 586, 298 - 189));
		hitboxes.add(new LevelHitbox(335, 389, 563 - 335, 500 - 389));
		hitboxes.draw();
		
		add(hitboxes);
	}

	override public function update(elapsed:Float):Void {
		super.update(elapsed);
		ui.updateUI(elapsed);
		FlxG.overlap(player, _coupon1, onCoupCollision);
		FlxG.overlap(player, _coupon2, onCoupCollision);
		FlxG.overlap(player, _coupon3, onCoupCollision);
		FlxG.overlap(player, transition, onTransPlate);
		FlxG.overlap(player, _npc1, onNPC1Collision);
		FlxG.overlap(player, _npc2, onNPC3Collision);
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
			transition.transition1();
		}
	}
	
	private function onNPC1Collision(player:Player, npc:Shopper1){
		FlxObject.separate(player, npc);
		ui.reduceTimer();
		ui.setInteractText(1);
		ui.setMonologueText(1);	
	}
	
	private function onNPC2Collision(player:Player, npc:Shopper2){
		FlxObject.separate(player, npc);
		ui.reduceTimer();
		ui.setInteractText(1);
		ui.setMonologueText(1);	
	}
	
	private function onNPC3Collision(player:Player, npc:Shopper3){
		FlxObject.separate(player, npc);
		ui.reduceTimer();
		ui.setInteractText(1);
		ui.setMonologueText(1);	
	}
}