package  
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	/**
	 * @brief GameManager Singleton
	 * @author Jose Luis Jimenez Urbano
	 */
	public final class GameManager {
		// Use
		// var game_manager:GameManager = new GameManager();
		
		private static var _instance:GameManager;
		private var _main:*;
		private var _current_scene:String; // main_menu - game
		public static var mouse_pos_x:Number = 0;
		public static var mouse_pos_y:Number = 0;
		public static var ship_pos_x:Number = 350;
		public static var ship_pos_y:Number = 400;
		public static var score:Number = 0;
		public static var game_lost:Boolean = false;
		
		
		//Debug
		private static var bg:Sprite;
		
		
		public function GameManager() {
			if(_instance){
				throw new Error("There is already a GameManager... Now Use GetGameManager()");
			} 
			_instance = this;
			init();
		}
		
		public static function GetGameManager():GameManager{
			if(!_instance){
				new GameManager();
			}
			return _instance;
		}
		
		
		public static function init():GameManager {
			//Set Background Color
			Misc.changeStageColor(000000); // -> Black
			_instance._current_scene = "main_menu";
			return _instance;
		}
		
		// GameManager.getCurrentScene
		public static function get getCurrentScene():String {
			return _instance._current_scene;
		}
		// GameManager.setCurrentScene
		public static function set setCurrentScene(scene:String):void {
			_instance._current_scene = scene;
		}
	}

}