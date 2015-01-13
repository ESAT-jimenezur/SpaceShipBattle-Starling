package{	
	
	import flash.display.MovieClip;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.trace.Trace;
	import flash.display.Graphics;
	import Input;
	
	/**
	 *
	 * @author Jose Luis Jimenez Urbano
	 */
	
	public final class Update extends MovieClip {

		
		//The maximum speed
		private var _max:Number = 50;
		
		private var dx:Number = 0;
		private var dy:Number = 0;
		
		public function updateGame():void{
		
		}
		
		public function onMouseMove(e:MouseEvent):void{
			GameManager.mouse_pos_x = e.stageX;
			GameManager.mouse_pos_y = e.stageY;
		}
		
		public function init():void {

			
		}
		
		public function addListeners():void{
			Misc._stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			//Misc._stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyBoardKeyDown);
			Misc._stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownHandler);
			Misc._stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUpHandler);
			Input.initialize(Misc._stage);
			Misc._stage.addEventListener(Event.ENTER_FRAME, refresh);
		}
		
		private function refresh(e:Event):void{
			//Key Handler
			if (Input.kd("A", "LEFT")){
				//Move to the left
				dx = dx < 0.5 - _max ? _max * -1 : dx - 0.5;
			}
			if (Input.kd("D", "RIGHT")){
				//Move to the right
				dx = dx > _max - 0.5 ? _max : dx + 0.5;
			}
			
			if (!Input.kd("A", "LEFT", "D", "RIGHT")){
				//If there is no left/right pressed
				if (dx > 0.5){
					dx = dx < 0.5 ? 0 : dx - 0.5;
				}
				else{
					dx = dx > -0.5 ? 0 : dx + 0.5;
				}
			}
			
			if (Input.kd("W", "UP")){
				//Move up
				dy = dy < 0.5 - _max ? _max * -1 : dy - 0.5;
			}
			if (Input.kd("S", "DOWN")){
				//Move down
				dy = dy > _max - 0.5 ? _max : dy + 0.5;
			}
			
			if (!Input.kd("W", "UP", "S", "DOWN")){
				//If there is no up/down action
				if (dy > 0.5){
					dy = dy < 0.5 ? 0 : dy - 0.5;
				}
				else{
					dy = dy > -0.5 ? 0 : dy + 0.5;
				}
			}
			
			//After all that, apply these to the object
			GameManager.ship_pos_x += dx;
			GameManager.ship_pos_y += dy;
			
		}
		

		private function onMouseDownHandler(event:MouseEvent):void {
			Misc.draw.createBullet();
		}
		
		private function onMouseUpHandler(event:MouseEvent):void {

		}
		
	}

}