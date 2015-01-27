package  
{
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.Color;
	import starling.animation.Tween;
	
	/**
	 * ...
	 * @author ...
	 */
	public class Bullet extends Sprite{
		
		var ini_x:Number;
		var end_x:Number;
		var ini_y:Number;
		var end_y:Number;
		
		var id:Number;
		
		var vel:Number = 1;
		var bullet:Quad;
		var tween:Tween;
		
		public function Bullet(ini_x:Number, ini_y:Number, end_x:Number, end_y:Number, n_id:Number) {
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
			id = n_id;
			createBullet(ini_x, ini_y, end_x, end_y);
		}
		
		private function onAdded(e:Event):void {
			//addEventListener(Event.ENTER_FRAME, loop);
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function loop(e:Event):void {
			//quad.y -= vel_;
		}
		
		
		
		private function createBullet(ini_x:Number, ini_y:Number, final_x:Number, final_y:Number):void {
			bullet = new Quad(5, 20, Color.YELLOW);
			bullet.x = ini_x;
			bullet.y = ini_y;
			end_x = final_x
			end_y = final_y;
			
			tween = new Tween(bullet, vel);
			tween.moveTo(end_x, end_y);
			Starling.juggler.add(tween);
			tween.onComplete = function():void { destroyBullet(); }
			
			addChild(bullet);
		}
		
		private function destroyBullet():void {
			bullet = null;
			removeChild(Main.bulletsLayer.getChildAt(Main.bullets[id]));
			Main.bullets.splice(id, 1);
			if (Main.bullets.length > 0) {
				Main.bullets.length--;
			}
			parent.removeChild(this);
			super.dispose();
		}
		
		
		
		
		
	}

}