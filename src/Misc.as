package{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import flash.net.URLRequest;
	
	/**
	 * ...
	 * @author Jose Luis Jimenez Urbano
	 * ilopez@esat.es
	 */
	public class Misc extends MovieClip{
		
		public static var _main:*;
		public static var _stage:Stage;
		public static var stageWidth:uint;
		public static var stageHeight:uint;
		public static var characterSelected:uint;
		public static var thumb_mc:MovieClip = new MovieClip();
		static private var destFunction:Function;
		
		public static var input:Input;
		public static var update:Update;
		public static var draw:Draw;
		
		public static function set setMain(main:*):void {
			_main = main;
			_stage = _main.stage;
			stageWidth = _stage.stageWidth;
			stageHeight = _stage.stageHeight;
		}
		
		public static function get getMain():* {
			return _main;
		}
		
		public static function setWidth(width : uint):void {
			stageWidth = width; 
		}
		
		public static function setHeight(height : uint):void {
			stageWidth = height; 
		}
		
		/**
		 * @param	color
		 */
		public static function changeStageColor( color : uint ) : void {
			var bg:Sprite;
			bg ||= new Sprite();
			bg.graphics.clear();
			bg.graphics.beginFill( color, 1 );
			bg.graphics.drawRect( 0,0, _stage.stageWidth, _stage.stageHeight );
			bg.graphics.endFill();
			_stage.addChildAt( bg, 0 );
		}
		
		public static function loadBitmap(url:String, format:String, dest:Function):void {
			destFunction = dest;
			var loader:Loader = new Loader();
			loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
			loader.load(new URLRequest("../assets/" + url + "." + format));
		}
		
		static private function onComplete(e:Event):void {
			destFunction();
		}
		
		
		
		private function onCompleteBitmap(e:Event):void {
			var bit:Bitmap = e.target.content as Bitmap;
			if (bit != null) {
				bit.smoothing = true;
				thumb_mc.addChild(e.target.content);
				bit.width = _stage.stageWidth;
				bit.height = _stage.stageHeight;
				addChild(thumb_mc);
			}
		}
		
	}

}