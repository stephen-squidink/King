package com.game.objects
{
	import com.game.core.GameObject;
	import com.util.player.Player;
	
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	public class GUI extends GameObject
	{
		private var _scoreText : TextField;
		private var _timeText : TextField;
		
		public function GUI(autoInitalise:Boolean=false)
		{
			super(autoInitalise);
		}
		
		override public function initialise():void
		{
			super.initialise();
			
			_scoreText = new TextField();
			_scoreText.defaultTextFormat = new TextFormat("Arial", 25, 0xFFFFFF, true);
			_scoreText.text = "Score: ";
			_scoreText.width = 200;
			_scoreText.x = 30;
			_scoreText.y = 50;
			
			_timeText = new TextField();
			_timeText.defaultTextFormat = new TextFormat("Arial", 25, 0xFFFFFF, true);
			_timeText.text = "Time: ";
			_timeText.width = 200;
			_timeText.x = 30;
			_timeText.y = _scoreText.y + _scoreText.height;
			
			addChild(_scoreText);
			addChild(_timeText);
		}
		
		override public function update():void
		{
			super.update();
			
			_scoreText.text = "Score: " + Player.getInstance().score;
			_timeText.text = "Time: " + getTime();
		}
		
		private function getTime():String
		{
			var time : String = "1:00";
			
			if(Player.getInstance().time < 60)
			{
				time = "0:" + (Player.getInstance().time < 10?"0":"") + Player.getInstance().time;
			}
			
			return time;
		}
	}
}