package com.game
{
	import com.game.core.GameScene;
	import com.game.scenes.MainScene;
	import com.util.constants.SceneNames;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Dictionary;
	
	public class Game extends Sprite
	{
		private var _scenes : Dictionary;
		private var _currentScene : GameScene;
		
		private static var _instance : Game = null;
		
		public static function getInstance():Game
		{
			if(_instance)
				return _instance;
			
			return null;
		}
		
		public function Game()
		{
			super();
			
			if(!_instance)
			{	
				_instance = this;
			
				addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			}
		}
		
		private function onAddedToStage(event : Event):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			init();
		}
		
		private function init():void
		{
			_scenes = new Dictionary();
			_scenes[SceneNames.MAIN_SCENE_NAME] = MainScene;
			
			showScene(SceneNames.MAIN_SCENE_NAME);
			
			addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(event : Event):void
		{
			if(_currentScene)
				_currentScene.update();
		}
		
		public function showScene(name : String):void
		{
			if(_currentScene)
			{
				_currentScene = null;
			}
			
			var sceneClass : Class = _scenes[name] as Class;
			_currentScene = new sceneClass() as GameScene;
			addChild(_currentScene);
			
			_currentScene.initialise();
		}
	}
}