package com.util.player
{
	import com.game.scenes.MainScene;
	import com.game.states.EndGameState;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;

	public class Player
	{
		private var _score : int = 0;
		private var _time : int = 60;
		
		private var _timer : Timer;
		
		private static var _instance : Player;
		
		public static function getInstance():Player
		{
			if(!_instance)
			{
				_instance = new Player();
			}
			
			return _instance;
		}
		
		public function get score():int
		{
			return _score;
		}
		
		public function get time():int
		{
			return _time;
		}
		
		public function Player()
		{
			_timer = new Timer(1000, 60);
			_timer.addEventListener(TimerEvent.TIMER, onTimer);
			_timer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimerComplete);
		}
		
		public function addScore(value : int):void
		{
			_score += value;
		}
		
		public function reset():void
		{
			_score = 0;
			_time = 60;
			_timer.reset();
			_timer.stop();
		}
		
		public function startGame():void
		{
			_timer.start();
		}
		
		private function onTimer(event : TimerEvent):void
		{
			_time -= 1;
		}
		
		private function onTimerComplete(event : TimerEvent):void
		{
			_time = 0;
			
			MainScene.changeState(new EndGameState());
		}
	}
}