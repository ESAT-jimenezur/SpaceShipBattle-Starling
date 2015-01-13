package {
	
	import flash.display.Bitmap;
	import starling.display.DisplayObject;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.KeyboardEvent;
	/*
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	*/
	
	/**
	 * 
	 * @author Jose Luis Jimenez Urbano
	 */
	public class Main extends Sprite {
		private var input:Input = new Input();
		private var update:Update = new Update();
		private var draw:Draw = new Draw();
		
		public function Main():void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			Misc.setMain = this;
			var game_manager:GameManager = new GameManager();	
			
			// Set up main loop
			addEventListener(Event.ENTER_FRAME, mainLoop);
			
			Misc._stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyBoardKeyDown);
			
			Misc.input = input;
			Misc.update = update;
			Misc.draw = draw;
			
			addChild(draw);		
		}
		
		private function onKeyBoardKeyDown(e:KeyboardEvent):void {
			if (GameManager.getCurrentScene == "main_menu") {
				if (e.keyCode == 32) {
					GameManager.setCurrentScene = "game";
					update.init();
					update.addListeners();
					draw.init();
				}
			}else if (GameManager.getCurrentScene == "score") {
				if (e.keyCode == 32) {
					GameManager.setCurrentScene = "game";
					GameManager.score = 0;
					GameManager.ship_pos_x = 350;
					GameManager.ship_pos_y = 400;
					GameManager.game_lost = false;
					update.init();
					update.addListeners();
					draw.init();
				}
			}
		}
		
		private function mainLoop(e:Event):void {
			if (GameManager.getCurrentScene == "main_menu") {
				draw.drawMenu();
			}else if (GameManager.getCurrentScene == "game") {
				//input.inputGame();
				update.updateGame();
				draw.drawGame();
			}else if (GameManager.getCurrentScene == "score") {
				draw.drawScoreMenu();
			}
			
		}
		
		
		
		
	}
	
}