package;
import flash.desktop.Clipboard;
import flixel.text.FlxText;

class Score extends FlxText
{
	var score : Int;
	var couponsCollected : Int;
	
	// How many points a second is worth
	var timeValue : Int = 5;
	
	// Super constructor has a bunch of parameters, but idk if we need them at the moment.
	public function new(startBalance:Int=0)
	{
		super();
		couponsCollected = 0;
		score = startBalance;
	}
	
	public function getScore():Int
	{
		return score;
	}
	
	public function getCoupons():Int
	{
		return couponsCollected;
	}
	
	public function collectCoupon(coup:Coupon):Void
	{
		score = score + coup.getValue;
		couponsCollected++;
		coup.destroy();
	}
	
	// To be called on level finish. Adds things like time bonus to final score
	// finalScore is a separate variable so we can have a tallying thing on the result screen if we want.
	public function tallyScore(finalTime:Int):Int
	{
		var finalScore = score + (intTime * timeValue);
		return finalScore;
	}
}