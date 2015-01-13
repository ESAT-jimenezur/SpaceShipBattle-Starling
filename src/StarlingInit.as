package  {
	import flash.display.Sprite;
	import starling.core.Starling;
	
	
	/**
	 * ...
	 * @author Jose Luis Jimenez Urbano
	 * 
	 */
	
	[SWF(framerate = 60, width = 800, height = 600)]
	public class StarlingInit extends Sprite{
		
		public function StarlingInit():void{
			var star:Starling = new Starling(Main, stage);
			star.start();
		}
		
	}

}