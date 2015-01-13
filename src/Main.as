package{
	//Starling Imports
	import flash.display.Bitmap;
	import flash.geom.Rectangle;
	import starling.display.Image;
	import starling.display.Shape;
	import starling.events.Event;
	import starling.display.Sprite;
	import starling.display.DisplayObject;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	//External libs
	import starling.display.Graphics;
	
	
	import flash.desktop.NativeApplication;
	//import flash.events.Event;
	//import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	
	/**
	 * ...
	 * @author Jose Luis Jimenez Urbano
	 *  texture packer online: 
	 * @link http://leshylabs.com/apps/sstool
	 */
	public class Main extends Sprite {
		
		//Public variables
		var date:Date = new Date();
		//Objects
		var texture_atlas:TextureAtlas;
		
		
		public function Main():void {
			addListeners();
			createObjects();
			drawBackground();
		}
		
		private function onAdded(e:Event):void {
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
			debugInfo("Starling Ready!");
		}
		
		private function addListeners():void {
			debugInfo("Adding Listeners");
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
			addEventListener(Event.ENTER_FRAME, mainLoop);
		}
		
		private function removeListeners():void {
			removeEventListener(Event.ENTER_FRAME, mainLoop);
		}
		
		private function mainLoop(e:Event):void {
			//This is our main loop
			
			
			
		}
		
		private function createObjects():void {
			var shape:Shape = new Shape();
			addChild(shape);
			shape.x = 20;
			shape.y = 20;
			
			shape.graphics.lineStyle(2,0xFFFFFF);
			shape.graphics.beginFill(0x0957c0);
			shape.graphics.drawRoundRect( 220, 0, 100, 100, 20 );
			shape.graphics.endFill();
			shape.graphics.lineStyle();
		}
		
		private function drawBackground():void {
			var bg_bitmap:Bitmap = new Assets.space_bg;
			var bg_texture:Texture = Texture.fromBitmap(bg_bitmap);
			var bg_image:Image = new Image(bg_texture);
			addChild(bg_image);
		}
		
		private function debugInfo(msg:String):void {
			trace(date + " ||| " + msg);
		}
		
		
	}
	
}