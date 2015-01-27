package  
{
	import flash.display.Bitmap;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	/**
	 * ...
	 * @author ...
	 */
	public class Enemy extends Sprite {
		
		var e_bitmap:Bitmap;
		var e_texture:Texture;
		var e_image:Image;
		var enemy:Sprite;
		var total_sprites:Number = 4;
		var vel:Number;
		
		public function Enemy(pos_x:Number, pos_y:Number) {
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
			enemy = new Sprite();
			vel = Math.round(Math.random() * 15 + 1);
			createEnemy(pos_x, pos_y);
		}
		
		private function onAdded(e:Event):void {
			addEventListener(Event.ENTER_FRAME, loop);
			removeEventListener(Event.ADDED_TO_STAGE, onAdded);
		}
		
		private function loop(e:Event):void {
			if (this.y <= 1280) {
				this.y += vel;
			}else {
				destroyEnemy();
			}
			
		}
		
		private function destroyEnemy():void {
			enemy.dispose();
			enemy = null;
			removeChild(enemy);
			parent.removeChild(this);
			super.dispose();
		}
		
		private function createEnemy(pos_x:Number, pos_y:Number):void {
			var rand_sprite = Math.round(Math.random() * 4 + 1);
			switch(rand_sprite) {
				case 1:
					e_bitmap = new Assets.enemy_ship1;
					break;
				case 2:
					e_bitmap = new Assets.enemy_ship2;
					break;
				case 3:
					e_bitmap = new Assets.enemy_ship3;
					break;
				case 4:
					e_bitmap = new Assets.enemy_ship4;
					break;
				default:
					e_bitmap = new Assets.enemy_ship1;
					break;
			}
			
			e_texture = Texture.fromBitmap(e_bitmap);
			e_image = new Image(e_texture);
			//e_image.x = -e_image.width / 2;
			//e_image.y = -e_image.height / 2;
			
			//e_image.rotation = 0;
			
			enemy.x = pos_x;
			enemy.y = pos_y;
			
			enemy.addChild(e_image);
			addChild(enemy);
		}
		
		
		
	}

}