package;

import flixel.FlxState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flixel.FlxG;

class UIFunctions {
	var monologueText:String;
	var interactText:String; //this should be updated upon a crash or coupon pickup
	var couponsText:String;
	var scoresText:String;
	var timerText:String;
	var monologueItem:FlxText;
	var interactItem:FlxText;
	var couponsItem:FlxText;
	var scoresItem:FlxText;
	var scores:Score;
	var timer:GameTimer;
	var timerItem:FlxText;
	var monologueTimer:FlxTimer;
	var interactTimer:FlxTimer;
	var advance:Bool;
	var textColor:FlxColor;
	var tempCoup:Coupon;
	var endHeaderScoreItem:FlxText;
	var endMoneyScoreItem:FlxText;
	var endCoupScoreItem:FlxText;
	var endTimeScoreItem:FlxText;
	var endTotalScoreItem:FlxText;
	var endScoreTimer:FlxTimer; //timer for end results
	var monoCrash:Array<String>;
	var monoCoup:Array<String>;
	var crashIt:Int;
	var coupIt:Int;
	var monoType:Int;
	var lvl:Int;
	
	public function new(t:Float, l:Int) { //NOTE: I am assuming 800 x 600 pixellation //NOTE: t is for TIME
		lvl = l;
		monologueText = "My dog likes eating bones and stuff.";
		monologueItem = new FlxText(0, 550, 800, monologueText);
		textColor = FlxColor.WHITE;
		monologueItem.alpha = 0;
		monologueItem.setFormat("Verdana", 16, textColor, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		interactText = "[insert interaction stuff here]";
		interactItem = new FlxText(15, 10, 800, interactText);
		interactItem.setFormat("assets/fonts/seguibl.ttf", 14, textColor, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		interactItem.alpha = 0;
		couponsText = "Coupons x 0";
		couponsItem = new FlxText(400, 10, 800, couponsText);
		couponsItem.setFormat("assets/fonts/seguibl.ttf", 14, textColor, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		scoresText = "Score: 0";
		scoresItem = new FlxText(550, 10, 800, scoresText);
		scoresItem.setFormat("assets/fonts/seguibl.ttf", 14, textColor, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		timerText = "[stuff about time]";
		timerItem = new FlxText(700, 10, 800, timerText);
		timerItem.setFormat("assets/fonts/seguibl.ttf", 14, textColor, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		scores = new Score(0);
		timer = new GameTimer(t);
		tempCoup = new Coupon();
		crashIt = 0;
		coupIt = 0;
		initMono();
		monologueTimer = new FlxTimer();
		interactTimer = new FlxTimer();
		endScoreTimer = new FlxTimer();
		endScoreTimer.active = false;
	}
	
	public function updateUI(elapsed):Void {
	//must be called every update and updates the display of score, coupon #, timer, monologue, and interact
	//stop calling once the level has ended
		textColor = FlxColor.WHITE;
		monologueItem.text = monologueText;
		interactItem.text = interactText;
		couponsItem.text = couponsText;
		scoresItem.text = scoresText;
		timer.updateTime(elapsed);
		timerText = "TIME: " + timer.getTime();
		timerItem.text = timerText;
		runMono();
		runInteract();
		if (endScoreTimer.active == true)
		{
			if
		}
	}
	
	public function setCoupons(c:Coupon):Void {
		scores.collectCoupon(c);
		couponsText = "COUPONS x " + scores.getCoupons();
		scoresText = "SCORE: " + scores.getScore();
	}
	
	public function reduceTimer():Void {
		timer.deductTime();
	}
	
	public function setMonologueText(type):Void {
	//this should be updated upon a crash or coupon pickup //int type indicates event type and int lvl indicates current level
		monoType = type;
		if (type == 1) { //indicates crash into shopper
			monologueText = monoCrash[crashIt];
			crashIt++;
			if (crashIt < 7)
			{
				monologueTimer.cancel();
				monologueTimer.start(5.5);
				monologueTimer.loops = 1;
			}
		}
		else if (type == 2) { //indicates coupon pickup
			monologueText = monoCoup[coupIt];
			coupIt++;
			if (coupIt < 7)
			{
				monologueTimer.cancel();
				monologueTimer.start(5.5);
				monologueTimer.loops = 1;
			}
		}
	}
	
	public function setInteractText(type):Void {
	//this should be updated upon a crash or coupon pickup
		if (type == 1) { //indicates crash into shopper
			interactText = "CRASHED INTO SHOPPER: -5 TIME";
			interactTimer.cancel();
			interactTimer.start(2.5);
			interactTimer.loops = 1;
		}
		else if (type == 2) { //indicates coupon pickup
			interactText = "COUPON OBTAINED: +50 SCORE";
			interactTimer.cancel();
			interactTimer.start(2.5);
			interactTimer.loops = 1;
		}
	}
	
	public function runMono():Void {
		if (monologueTimer.elapsedTime > 5) {
			monologueTimer.cancel();
			monologueItem.alpha = 0;
		}
		else if (monologueTimer.active == true)
		{
			monologueItem.alpha = 1;
		}
	}
	
	public function runInteract():Void {
		if (interactTimer.elapsedTime > 2) {
			interactTimer.cancel();
			interactItem.alpha = 0;
		}
		else if (interactTimer.active == true)
		{
			interactItem.alpha = 1;
		}
	}
	
	public function getEndResults():Void {
	//all level assets alpha values should be set to 0 or assets destroyed at this point
		monologueItem.alpha = 0;
		monologueTimer.active = false;
		interactItem.alpha = 0;
		interactTimer.active = false;
		couponsItem.alpha = 0;
		scoresItem.alpha = 0;
		timerItem.alpha = 0;
		endHeaderScoreItem = new FlxText(0, 150, 800, "");
		endHeaderScoreItem.setFormat("assets/fonts/seguibl.ttf", 16, textColor, "center");
		endMoneyScoreItem = new FlxText(0, 200, 800, "");
		endMoneyScoreItem.setFormat("assets/fonts/seguibl.ttf", 16, textColor, "center");
		endMoneyScoreItem.alpha = 0;
		endCoupScoreItem = new FlxText(0, 250, 800, "");
		endCoupScoreItem.setFormat("assets/fonts/seguibl.ttf", 16, textColor, "center");
		endCoupScoreItem.alpha = 0;
		endTimeScoreItem = new FlxText(0, 300, 800, "");
		endTimeScoreItem.setFormat("assets/fonts/seguibl.ttf", 16, textColor, "center");
		endTimeScoreItem.alpha = 0;
		endTotalScoreItem = new FlxText(0, 350, 800, "");
		endTotalScoreItem.setFormat("assets/fonts/seguibl.ttf", 16, textColor, "center");
		endTotalScoreItem.alpha = 0;
		endHeaderScoreItem.text = "LEVEL " + lvl + " SCORE";
		var ms:Int = -200;
		if (lvl == 2)
			ms = -400;
		else if (lvl == 3)
			ms = -600;
		endMoneyScoreItem.text = "Money Spent: " + ms + " points";
		var ts:Int = timer.finalTime() * 5;
		endTimeScoreItem.text = "Time Remaining: " + ts + " points";
		var cs:Int = scores.getScore();
		endCoupScoreItem.text = "Coupons Collected: " + cs + " points";
		var total:Int = ms + ts + cs;
		endTotalScoreItem.text = "Total Score: " + total + " points";
		endScoreTimer.start(10.5);
	}
	
	public function getMonologueItem():FlxText {
		return monologueItem;
	}
	
	public function getInteractItem():FlxText {
		return interactItem;
	}
	
	public function getCurrentCoupons():Int {
		return scores.getCoupons();
	}
	
	public function getCurrentScore():Int {
		return scores.getScore();
	}
	
	public function getCurrentTime():Int {
		return timer.getTime();
	}
	
	public function getCouponsItem():FlxText {
		return couponsItem;
	}
	
	public function getScoresItem():FlxText {
		return scoresItem;
	}
	
	public function getTimerItem():FlxText {
		return timerItem;
	}
	
	private function initMono() {
		monoCrash = new Array();
		monoCoup = new Array();
		if (lvl == 1) {
			monoCrash.push("Whoops");
			monoCrash.push("They crashed into me!");
			monoCrash.push('"Out of the way!"');
			monoCrash.push("I hated that guy anyway");
			monoCrash.push("Their fault, not mine");
			monoCrash.push("They probably liked anime");
			monoCrash.push('"Gotta go fast!"');
			monoCoup.push("25% off toilet paper");
			monoCoup.push("10% off canned meat, what a steal");
			monoCoup.push("20% off frozen pizza, yum");
			monoCoup.push("I wish I was still with my husband");
			monoCoup.push("30% off bacon... turkey bacon");
			monoCoup.push("20% off ice cream");
			monoCoup.push("50% off a $10 bag of potato chips, what a rip-off");
		}
		if (lvl == 2) {
			monoCrash.push("What a weird guy");
			monoCrash.push("Why would anyone ever buy a pile of rocks?");
			monoCrash.push("That guy reminds me of my now estranged husband of five years");
			monoCrash.push("I hate mondays");
			monoCrash.push("'Everyone' in this 'store' seems to be 'insane'.");
			monoCrash.push("From their perspective I'm the enemy");
			monoCrash.push("Their cart was filled with grass... this place is weird");
			monoCoup.push("100% off sunflower seeds. I guess that's what's for dinner");
			monoCoup.push("100% off green meat. What IS green meat exactly?");
			monoCoup.push("Maybe the green meat is people");
			monoCoup.push("100% off a brand new shoe, a single shoe");
			monoCoup.push("100% off my soul... weird");
			monoCoup.push("100% off a 100% off coupon for 100% off a 100% off coupon");
			monoCoup.push("100% off an OUYA. All my dreams are coming true");
		}
		if (lvl == 3) {
			monoCrash.push("How did I get here?");
			monoCrash.push("Was that shopper a figment of my imagination?");
			monoCrash.push("Maybe I'm a figment of their imagination");
			monoCrash.push("Ok. Wait. That guy was definitely my estranged husband");
			monoCrash.push("Maybe I was the shopping cart all along");
			monoCrash.push("Am I me? Are you you? Was that thing a thing at all?");
			monoCrash.push("Maybe I am my husband. I'm estranged from myself. That's deep");
			monoCoup.push("200% off the ocean. How does that even work?");
			monoCoup.push("$500 for my soul... wait, that's not a coupon at all");
			monoCoup.push("1000% off a yacht. These deals are crazy");
			monoCoup.push("10% off a box of crackers. Ok then");
			monoCoup.push("That one was my pet dog Scruffy disguised as a coupon");
			monoCoup.push("5000% off my hopes and dreams. Weird");
			monoCoup.push("This one's just a five million dollar check");
		}
	}
	
	public function getEndHeaderScoreItem():FlxText {
		return endHeaderScoreItem;
	}
	
	public function getEndMoneyScoreItem():FlxText {
		return endMoneyScoreItem;
	}
	
	public function getEndCoupScoreItem():FlxText {
		return endCoupScoreItem;
	}
	
	public function getEndTimeScoreItem():FlxText {
		return endTimeScoreItem;
	}
	
	public function getEndTotalScoreItem():FlxText {
		return endTotalScoreItem;
	}
}
