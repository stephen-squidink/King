package com.game.scenes
{
	import com.game.Game;
	import com.game.core.GameScene;
	import com.game.objects.Background;
	import com.util.constants.Constants;
	import com.util.constants.SceneNames;
	import com.util.player.Player;
	
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	import assets.AssetEmbed;
	
	public class EndScene extends GameScene
	{
		private var _background : Background;
		private var _replay : Sprite;
		private var _back : Sprite;
		private var _scoreText : TextField;
		
		public function EndScene()
		{
			super();
		}
		
		override public function initialise():void
		{
			super.initialise();
			
			_background = new Background(true);
			
			var overlay : Sprite = new Sprite();
			with(overlay)
			{
				graphics.beginFill(0x000000,0.5)
				graphics.drawRect(0,0, _background.width, _background.height);
				graphics.endFill();
			}
			
			var panel : Sprite = new Sprite()
			with(panel)
			{
				graphics.beginBitmapFill(AssetEmbed.PANEL_BITMAP.bitmapData);
				graphics.drawRect(0,0,AssetEmbed.PANEL_BITMAP.width, AssetEmbed.PANEL_BITMAP.height);
				graphics.endFill();
			}
			panel.x = (_background.width - panel.width) / 2;
			panel.y = (_background.height - panel.height) / 2;
			
			_back = new Sprite();
			_back.addChild(AssetEmbed.BACK_BUTTON_BITMAP);
			_back.addEventListener(MouseEvent.CLICK, onBackClicked);
			_back.addEventListener(MouseEvent.MOUSE_DOWN, onButtonDown);
			_back.addEventListener(MouseEvent.MOUSE_OVER, onButtonDown);
			_back.addEventListener(MouseEvent.MOUSE_UP, onButtonUp);
			_back.addEventListener(MouseEvent.MOUSE_OUT, onButtonUp);
			_back.x = (panel.width - _back.width )/ 2;
			_back.y = panel.height - _back.height - 20;
			
			_replay = new Sprite();
			_replay.addChild(AssetEmbed.REPLAY_BUTTON_BITMAP);
			_replay.addEventListener(MouseEvent.CLICK, onReplayClicked);
			_replay.addEventListener(MouseEvent.MOUSE_DOWN, onButtonDown);
			_replay.addEventListener(MouseEvent.MOUSE_OVER, onButtonDown);
			_replay.addEventListener(MouseEvent.MOUSE_UP, onButtonUp);
			_replay.addEventListener(MouseEvent.MOUSE_OUT, onButtonUp);
			_replay.x = (panel.width - _replay.width )/ 2;
			_replay.y = _back.y - _replay.height - 10;
			
			var yourscoreText : TextField = new TextField();
			yourscoreText.defaultTextFormat = new TextFormat("Arial", 44, 0xFFFFFF, true);
			yourscoreText.text = "YOU SCORED";
			yourscoreText.width = 300;
			yourscoreText.height = 55;
			yourscoreText.x = _replay.x;
			yourscoreText.y = 20;
			
			_scoreText = new TextField();
			_scoreText.defaultTextFormat = new TextFormat("Arial", 70, 0xFFFFFF, true);
			_scoreText.text = "" + Player.getInstance().score;
			_scoreText.width = 300;
			_scoreText.height = 80;
			_scoreText.x = _replay.x;
			_scoreText.y = yourscoreText.y + yourscoreText.height + 25;
			
			
			addChild(_background);
			addChild(overlay);
			addChild(panel);
			panel.addChild(yourscoreText);
			panel.addChild(_scoreText);
			panel.addChild(_replay);
			panel.addChild(_back);
		}
		
		override public function reset():void
		{
			super.reset();
			
			_scoreText.text = "" + Player.getInstance().score;
		}
		
		private function onButtonDown(event : MouseEvent):void
		{
			if(event.buttonDown)
			{
				event.currentTarget.filters = [Constants.GLOW_HIGHLIGHT];
			}
		}
		
		private function onButtonUp(event : MouseEvent):void
		{
			event.currentTarget.filters = [];
		}
		
		private function onReplayClicked(event : MouseEvent):void
		{
			Game.getInstance().showScene(SceneNames.MAIN_SCENE_NAME);
		}
		
		private function onBackClicked(event : MouseEvent):void
		{
			Game.getInstance().showScene(SceneNames.START_SCENE_NAME);
		}
	}
}