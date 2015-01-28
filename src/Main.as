package{
	//Starling Imports
	import flash.geom.Point;
	import flash.text.TextFormat;
	import flash.utils.getTimer;
	import starling.core.Starling;
	import starling.display.MovieClip;
	import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Shape;
	import starling.events.Event;
	import starling.events.EnterFrameEvent;
	import starling.display.Sprite;
	import starling.display.DisplayObject;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	import starling.events.Touch;
	import starling.utils.Color;
	import starling.utils.HAlign;
	import starling.utils.VAlign;

	
	
	//External libs
	import starling.display.Graphics;
	
	
	import flash.desktop.NativeApplication;
	import flash.display.Bitmap;
	import flash.geom.Rectangle;
	//import flash.events.Event;
	//import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;

	
	
	/**
	 * ...
	 * @author Jose Luis Jimenez Urbano
	 *  texture packer online: 
	 * @link http://leshylabs.com/apps/sstool
	 */
	public class Main extends Sprite {
		
		//Public variables
		var date:Date = new Date();
		
		var player_ship:Sprite;
		
		public static var bullets:Array;
		public static var bulletsLayer:Sprite;
		
		private var enemies:Array;
		private var enemiesLayer:Sprite;
		
		private var lastEnemiesGen:int
		private var lastShot:int
		
		private var scene_:Number = 1;
		private var lives_:Number = 3;
		private var lives_textfield_:TextField;
		private var points_:Number = 0;
		private var points_textfield_:TextField;
		
		
		private var main_menu_title:TextField;
		private var main_menu_press:TextField;
		
		public function Main():void {
			addListeners();
		}
		
		private function onAdded(e:Event):void {
			if (scene_ == 0) {
				//removeEventListener(Event.ADDED_TO_STAGE, onAdded);
				//initialize();
				//drawGame();
				
			}else if (scene_ == 1) {
				addEventListener(TouchEvent.TOUCH, onMenuTouch);
				addEventListener(EnterFrameEvent.ENTER_FRAME, mainMenuLoop);
			}
			debugInfo("Starling Ready!");
		}
		

		
		private function mainMenuLoop(e:EnterFrameEvent):void {
			drawMenu();
		}
		
		private function drawMenu():void {
			drawBackground();
			main_menu_title = new TextField(500, 500, "SpaceShipBattle - Starling", "verdana", 30, Color.WHITE, true);
			main_menu_title.x = 100;
			main_menu_title.y = 100;
			addChild(main_menu_title);
			
			main_menu_press = new TextField(500, 500, "Tap the screen to play", "verdana", 15, Color.WHITE, true);
			main_menu_press.x = 100;
			main_menu_press.y = 500;
			addChild(main_menu_press);
		}
		
		private function onMenuTouch(e:TouchEvent):void {
			trace(scene_);
			var touch:Touch = e.getTouch(this, TouchPhase.BEGAN);
			if (touch) {
				scene_ = 0;
				removeEventListener(Event.ENTER_FRAME, mainMenuLoop);
				removeEventListener(Event.ADDED_TO_STAGE, onAdded);
				initialize();
				drawGame();
			}
		}
		
		private function addListeners():void {
			debugInfo("Adding Listeners");
			addEventListener(Event.ADDED_TO_STAGE, onAdded);
			//addEventListener(Event.ENTER_FRAME, mainLoop);
		}
		
		private function removeListeners():void {
			//removeEventListener(EnterFrameEvent.ENTER_FRAME, mainLoop);
		}
		
		private function initialize():void {
			drawBackground();
			
			lives_textfield_ = new TextField(100, 40, "Lives " + lives_, "Arial", 22, Color.YELLOW, true);
			lives_textfield_.x = 10;
			lives_textfield_.y = 20;
			addChild(lives_textfield_);
			
			points_textfield_ = new TextField(100, 40, "Score " + points_, "Arial", 22, Color.YELLOW, true);
			points_textfield_.x = 600;
			points_textfield_.y = 20;
			addChild(points_textfield_);
			
			//var player_ship_bitmap:Bitmap = new Assets.ss_ship3;
			//var player_ship_texture:Texture = Texture.fromBitmap(player_ship_bitmap);
			//var player_ship:Image = new Image(player_ship_texture);
			player_ship = new Sprite();
			var player_ship_bitmap:Bitmap = new Assets.ss_ship3;
			var player_ship_texture:Texture = Texture.fromBitmap(player_ship_bitmap);
			var player_ship_image:Image = new Image(player_ship_texture);
			player_ship.addChild(player_ship_image);
			player_ship.x = (720 / 2) - 38;
			player_ship.y = 1000;
			addChild(player_ship);
			
			bullets = new Array();
			bullets.length = 0;
			bulletsLayer = new Sprite();
			addChild(bulletsLayer);
			
			enemies = new Array();
			enemiesLayer = new Sprite();
			addChild(enemiesLayer);
			
			generateEnemies();
		}
		
		private function drawGame():void {
			lives_textfield_.text = "Lives " + lives_.toString();
			points_textfield_.text = "Score " + points_.toString();
			
			addEventListener(TouchEvent.TOUCH, onTouch);
			addEventListener(EnterFrameEvent.ENTER_FRAME, doUpdates);
		}

		private function doUpdates(e:Event):void {
			
			if (scene_ == 0) {
				drawGame();
				Starling.juggler.delayCall(generateEnemies, 1.0);
				//trace(enemies[i].getBounds(enemies[i].parent).intersects(bullets[i].getBounds(bullets[i].parent)));
				
				if (enemies.length != 0 && bullets.length != 0) {
					
					for (var i:int = 0; i < enemies.length; i++) {
						for (var j:int = 0; j < bullets.length; j++) {
							//trace(bulletsLayer.getChildAt(bullets[j]).getBounds(this.parent));
							//trace(enemiesLayer.getChildAt(enemies[i]).getBounds(this.parent));

							if (bulletsLayer.getChildAt(bullets[j]).getBounds(bullets[j].parent).intersects(enemiesLayer.getChildAt(enemies[i]).getBounds(enemies[i].parent))) {
								trace("Colision");
								points_ += 100;
								trace(bulletsLayer.getChildAt(bullets[j]).getBounds(this.parent));
								trace(enemiesLayer.getChildAt(enemies[i]).getBounds(this.parent));
								enemies[i] = null;
								enemiesLayer.removeChild(enemiesLayer.getChildAt(enemies[i]));
								enemies.splice(i, 1);
								if (enemies.length > 0) {
									enemies.length--;
								}
								//enemiesLayer.removeChild(enemies[i]);
							}
							
						}
						if (enemiesLayer.getChildAt(enemies[i]).getBounds(this).intersects(player_ship.parent.getBounds(this))) {
							lives_--;
							if (lives_ <= 3) {
								//scene_ = 10;
							}
						}
					}
				}
			}else if (scene_ == 1) {
				stage.color = 0x000000;
			}
			


		}
		
		private function generateEnemies():void {
			trace("generating enemies");
			var now:Number = getTimer();
			var ellapsed:Number = now - lastEnemiesGen;
			if (ellapsed >= 5000) {
				lastEnemiesGen = now;
				var n_enemies:Number = Math.round(Math.random() * 5 + 1);
				for (var i:int = 0; i < n_enemies; i++) {
					var enemy:Enemy = new Enemy(Math.round(Math.random() * 700 + 10), Math.round(Math.random() * 50 - 150)); //Random X POS
					enemiesLayer.addChild(enemy);
					enemies.push(enemy);
				}
			}
		}
		
		
		 private function onTouch(event:TouchEvent):void {
			var touches:Vector.<Touch> = event.getTouches(this, TouchPhase.MOVED);
			var now:Number = getTimer();
			var ellapsed:Number = now - lastShot;
			
			if (touches.length == 1) {
				var touch:Touch = touches[0];
				
				var currentPos:Point  = touch.getLocation(this);
				var previousPos:Point = touch.getPreviousLocation(this);
				var touch_x:Number = currentPos.x;
				var touch_y:Number = currentPos.y;
				player_ship.x = touch_x - 39;
				player_ship.y = touch_y;
			}else if (touches.length == 2) {
				var touch1:Touch = touches[0];
				var touch2:Touch = touches[1];
				var touch1_pos:Point = touch1.getLocation(this);
				var touch2_pos:Point = touch2.getLocation(this);
				
				player_ship.x = touch1_pos.x - 39;
				player_ship.y = touch1_pos.y;
				if (ellapsed >= 100) {
					lastShot = now;
					var bullet:Bullet = new Bullet(touch1_pos.x, touch1_pos.y, touch2_pos.x, touch2_pos.y, bullets.length);
					bulletsLayer.addChild(bullet);
					bullets.push(bullet);
				}
				
				
			}
			
			
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