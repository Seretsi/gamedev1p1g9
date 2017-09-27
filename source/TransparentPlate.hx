package;

import flixel.FlxSprite;
import flixel.FlxG;

class TransparentPlate extends FlxSprite
{	
	public function new(?X:Float=0, ?Y:Float=0)	{
		super(X,Y);
		loadGraphic("assets/art/maybe_transparent.png");
		setGraphicSize(70, 0);
	}
	
	public function transition1():Void{
		cutscene2();
	}
	
	public function transition2():Void{
		cutscene3();
	}
	
	public function transition3():Void{
		cutsceneEnd();
	}
	
	private function cutscene2(){
		FlxG.switchState(new CutsceneTwoState());
	}
	
	private function cutscene3(){
		FlxG.switchState(new CutsceneThreeState());
	}
	
	private function cutsceneEnd(){
		FlxG.switchState(new CutsceneEndState());
	}
}