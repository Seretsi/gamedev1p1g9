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
		textColor = FlxColor.WHITE;
		//monologueItem.setFormat("Verdana", 14, textColor, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		monologueItem.text = monologueText;
		//interactItem.setFormat("Verdana", 14, textColor, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		interactItem.text = interactText;
		//couponsItem.setFormat("Verdana", 14, textColor, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		couponsItem.text = couponsText;
		//scoresItem.setFormat("Verdana", 14, textColor, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		scoresItem.text = scoresText;
		//timerItem.setFormat("Verdana", 14, textColor, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
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
			interactText = "CRASHED INTO SHOPPER: -5 SCORE";
		}
		else if (type == 2) { //indicates coupon pickup
			interactText = "COUPON OBTAINED: +50 SCORE";
		}
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
