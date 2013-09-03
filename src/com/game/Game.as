package com.game
{
	import com.game.core.GameScene;
	import com.game.scenes.EndScene;
	import com.game.scenes.MainScene;
	import com.game.scenes.StartScene;
	import com.util.constants.SceneNames;
	
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.utils.Dictionary;
	
	public class Game extends Sprite
	{
		private var _cache : Dictionary;
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
			_cache = new Dictionary();
			_scenes = new Dictionary();
			_scenes[SceneNames.MAIN_SCENE_NAME] = MainScene;
			_scenes[SceneNames.START_SCENE_NAME] = StartScene;
			_scenes[SceneNames.END_SCENE_NAME] = EndScene;
			
			showScene(SceneNames.START_SCENE_NAME);
			
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
				this.removeChild(_currentScene);
				_currentScene = null;
			}
			
			if(!_cache[name])
			{
				var sceneClass : Class = _scenes[name] as Class;
				_currentScene = new sceneClass() as GameScene;
				addChild(_currentScene);
				
				_currentScene.initialise();
				
				_cache[name] = _currentScene;
			}
			else
			{
				_currentScene = _cache[name];
				
				_currentScene.reset();
				addChild(_currentScene);
			}
			
		}
	}
}