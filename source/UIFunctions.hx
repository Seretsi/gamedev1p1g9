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
	var scoreText:String;
	var timerText:String;
	var monologueItem:FlxText;
	var interactItem:FlxText;
	var couponsItem:Coupon;
	var scoreItem:Score;
	var timerItem:Timer;
	var monologueTimer:FlxTimer;
	var interactTimer:FlxTimer;
	var advance:Bool;
	var coupons:Int;
	var score:Int;
	var timer:Float;
	var textColor:FlxColor;
	
	public function new() { //NOTE: I am assuming 800 x 600 pixellation
		monologueText = "[insert monologue here]";
		monologueItem = new FlxText(0, 550, 800, monologueText);
		textColor = FlxColor.WHITE;
		monologueItem.setFormat("Verdana", 14, textColor, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		interactText = "[insert interaction stuff here]";
		interactItem = new FlxText(15, 10, 800, interactText);
		interactItem.setFormat("Verdana", 14, textColor, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		couponsText = "[stuff about coupons]";
		couponsItem = new FlxText(350, 10, 800, couponsText);
		couponsItem.setFormat("Verdana", 14, textColor, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		scoreText = "[stuff about score]";
		scoreItem = new FlxText(500, 10, 800, scoreText);
		scoreItem.setFormat("Verdana", 14, textColor, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		timerText = "[stuff about time]";
		timerItem = new FlxText(650, 10, 800, timerText);
		timerItem.setFormat("Verdana", 14, textColor, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
	}
	
	public function updateUI():Void {
	//must be called every update and updates the display of score, coupon #, timer, monologue, and interact
		textColor = FlxColor.WHITE;
		monologueItem.setFormat("Verdana", 14, textColor, "center", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		monologueItem.text = monologueText;
		interactItem.setFormat("Verdana", 14, textColor, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		interactItem.text = interactText;
		setCouponsScoreTimer();
		couponsItem.setFormat("Verdana", 14, textColor, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		couponsItem.text = couponsText;
		scoreItem.setFormat("Verdana", 14, textColor, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		scoreItem.text = scoreText;
		timerItem.setFormat("Verdana", 14, textColor, "left", FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
		timerItem.text = timerText;
	}
	
	public function setCouponsScoreTimer():Void { //make these separate variables
		couponsText = "Coupons x 3";
		scoreText = "Score: 500";
		timerText = "Time Left: 15";
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
			interactText = "CRASHED INTO SHOPPER: -99 SCORE";
		}
		else if (type == 2) { //indicates coupon pickup
			interactText = "COUPON OBTAINED: +9999 SCORE";
		}
	}
	
	public function getMonologueItem():FlxText {
		return monologueItem;
	}
	
	public function getInteractItem():FlxText {
		return interactItem;
	}
	
	public function getCouponsItem():Coupon {
		return couponsItem;
	}
	
	public function getScoreItem():Score {
		return scoreItem;
	}
	
	public function getTimerItem():Timer {
		return timerItem;
	}
}
