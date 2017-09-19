package;

/**
 * ...
 * @author Becca Sheridan
 */
 import flixel.FlxSprite;
 import flixel.system.FlxAssets.FlxGraphicAsset;

 class Player extends FlxSprite
 {
	 
	 var speed:Float = 0;
	 var _drift:Float = 0;
	 var _up:Bool = false;
	 var _down:Bool = false;
	 var _right:Bool = false;
	 var _left:Bool = false;
	 var CONSTANT _width:Int = 10;
	 var CONSTANT _height:Int = 10;
	 
     public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset)
     {
         super(X, Y, SimpleGraphic);
		 //loadGraphic("assets/images/SPRITENAME.filetype", true, _width, _height);
		 //And like. some spriting stuff. i'll get to 
     }
	 
	 override public function update(elapsed:Float):Void{
		 super.update(elapsed);
		 poll();
		 movement();
		 //tbh i dont know what this does but like w/e
	 }
	 
	 function poll():Void{
		_up = FlxG.keys.anyPressed([UP, W]);
		_down = FlxG.keys.anyPressed([DOWN, S]);
		_left = FlxG.keys.anyPressed([LEFT, A]);
		_right = FlxG.keys.anyPressed([RIGHT, D]);		
	}
	
	function movement():Void{
		if (_up || _down || _left || _right){
			if (_left){
				_rot = 180;
				facing  = FlxObject.LEFT;
			}
			else if (_right){
				_rot = 0;
				facing = FlxObject.RIGHT;
			}
			velocity.set (speed, 0);
			velocity.rotate(new FlxPoint(0,0), _rot);
			//animation.play("walk");
		}
		else animation.stop();
	}
	
	//Definitely lifted this from Marc's example code. Definitely will tailor to our stuff with sprites
 }