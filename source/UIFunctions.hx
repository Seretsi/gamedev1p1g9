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
	var endItem:FlxText;
	var interactTimer:FlxTimer; //timer for interact text
	var endResultsTimer:FlxTimer; //timer for end results
	var levelOneMonoCrash:Array<String>;
	var levelTwoMonoCrash:Array<String>;
	var levelThreeMonoCrash:Array<String>;
	var levelOneMonoCoup:Array<String>;
	var levelTwoMonoCoup:Array<String>;
	var levelThreeMonoCoup:Array<String>;
	
	public function new(t) { //NOTE: I am assuming 800 x 600 pixellation //NOTE: t is for TIME
		monologueText = "My dog likes eating bones and stuff.";
		monologueItem = new FlxText(0, 550, 800, monologueText);
		textColor = FlxColor.WHITE;
		monologueItem.setFormat("Verdana", 16, textColor, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		interactText = "[insert interaction stuff here]";
		interactItem = new FlxText(15, 10, 800, interactText);
		interactItem.setFormat("assets/fonts/seguibl.ttf", 14, textColor, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		couponsText = "[stuff about coupons]";
		couponsItem = new FlxText(400, 10, 800, couponsText);
		couponsItem.setFormat("assets/fonts/seguibl.ttf", 14, textColor, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		scoresText = "[stuff about score]";
		scoresItem = new FlxText(550, 10, 800, scoresText);
		scoresItem.setFormat("assets/fonts/seguibl.ttf", 14, textColor, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		timerText = "[stuff about time]";
		timerItem = new FlxText(700, 10, 800, timerText);
		timerItem.setFormat("assets/fonts/seguibl.ttf", 14, textColor, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		scores = new Score(0);
		timer = new GameTimer(t);
		tempCoup = new Coupon();
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
		if (timer.getTime() < 50)
			setCoupons(tempCoup);
	}
	
	public function setCoupons(c:Coupon):Void {
		scores.collectCoupon(c);
		couponsText = "COUPONS x " + scores.getCoupons();
		scoresText = "SCORE: " + scores.getScore();
	}
	
	public function reduceTimer():Void {
		timer.deductTime();
	}
	
	public function setMonologueText(type, lvl):Void {
	//this should be updated upon a crash or coupon pickup //int type indicates event type and int lvl indicates current level
		if (type == 1) { //indicates crash into shopper
			if (lvl == 1) {
				monologueText = "Level 1 CRASH";
			}
			else if (lvl == 2) {
				monologueText = "Level 2 CRASH";
			}
			else if (lvl == 3) {
				monologueText = "Level 3 CRASH";
			}
		}
		else if (type == 2) { //indicates coupon pickup
			if (lvl == 1) {
				monologueText = "Level 1 COUPON";
			}
			else if (lvl == 2) {
				monologueText = "Level 2 COUPON";
			}
			else if (lvl == 3) {
				monologueText = "Level 3 COUPON";
			}
		}
	}
	
	public function setInteractText(type):Void {
	//this should be updated upon a crash or coupon pickup
		if (type == 1) { //indicates crash into shopper
			interactText = "CRASHED INTO SHOPPER: -5 TIME";
		}
		else if (type == 2) { //indicates coupon pickup
			interactText = "COUPON OBTAINED: +50 SCORE";
		}
	}
	
	public function getEndResults():Void {
		monologueItem.alpha = 0;
		interactItem.alpha = 0;
		couponsItem.alpha = 0;
		scoresItem.alpha = 0;
		timerItem.alpha = 0;
		var timeScore:Int = timer.finalTime() * 5;
		var endScore:String = " -  250 from money spent\n" + " + " + scores.getScore() + " from coupons" + "\n" + " + " ;
		endItem = new FlxText(0, 200, 800, endScore);
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
}
