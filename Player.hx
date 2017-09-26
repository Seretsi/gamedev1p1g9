package;

/**
 * @author Becca Sheridan
 */
 
 import flixel.FlxG;
 import flixel.FlxSprite;
 import flixel.system.FlxAssets.FlxGraphicAsset;
 import flixel.math.FlxPoint;
 import flixel.FlxObject;
 
 import flixel.util.FlxColor;

 class Player extends FlxSprite {
	 
	 var speed:Float = 200;
	 var _up:Bool = false;
	 var _down:Bool = false;
	 var _right:Bool = false;
	 var _left:Bool = false;
	 var WIDTH:Int = 300;
	 var HEIGHT:Int = 700;
	 
     public function new(?X:Float=0, ?Y:Float=0)     {
         super(X, Y);
		 //loadGraphic("assets/images/IMGNAME.png", true, WIDTH, HEIGHT);
		 makeGraphic(16, 16, FlxColor.BLUE);
		 drag.x = drag.y = 1600;
     }
	 
	 override public function update(elapsed:Float):Void	{
		 movement();
		 super.update(elapsed);
	 }
	
	function movement():Void	{
		
	 _up = FlxG.keys.anyPressed([UP, W]);
	 _down = FlxG.keys.anyPressed([DOWN, S]);
	 _right = FlxG.keys.anyPressed([RIGHT, D]);
	 _left = FlxG.keys.anyPressed([LEFT, A]);
	 
	 if (_up && _down){
		 _up = _down = false;
	 }
	 if (_right && _left){
		 _right = _left = false;
	 }
		
		if (_up || _down || _left || _right){
			velocity.x = speed;
			velocity.y = speed;
			var mA:Float = 0;
			if (_up){
				mA =-90;
				if (_left){
					mA -= 45;
				} else if (_right){
					mA += 45;
				}
			} else if (_down){
				mA = 90;
				if (_left){
					mA += 45;
				} else if (_right){
					mA -= 45;
				}
			} else if (_left){
				mA = 180;
			} else if (_right){
				mA = 0;
			}
			mA -= 20;
			velocity.set(speed, 0);
			velocity.rotate(FlxPoint.weak(0, 0), mA);
		}
		
	}
 }