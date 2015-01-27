package  {
	import flash.display.Sprite;
	import starling.core.Starling;
	
	
	/**
	 * ...
	 * @author Jose Luis Jimenez Urbano
	 * 
	 */
	
	[SWF(framerate = 60, width = 720, height = 1280)]
	public class StarlingInit extends Sprite{
		
		public function StarlingInit():void {
			Starling.multitouchEnabled = true;
			var star:Starling = new Starling(Main, stage);
			star.simulateMultitouch = true;
			star.start();
		}
		
	}

}