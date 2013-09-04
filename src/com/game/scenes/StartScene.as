package com.game.scenes
{
	import com.game.Game;
	import com.game.core.GameScene;
	import com.game.objects.Background;
	import com.util.constants.Constants;
	import com.util.constants.SceneNames;
	
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	
	import assets.AssetEmbed;
	
	public class StartScene extends GameScene
	{
		private var _background : Background;
		private var _play : Sprite;
		
		public function StartScene()
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
			
			var title : Bitmap = AssetEmbed.TITLE_BITMAP;
			title.x =  (panel.width - title.width )/ 2;
			title.y = 50;
			panel.addChild(title);
			
			_play = new Sprite();
			_play.addChild(AssetEmbed.PLAY_BUTTON_BITMAP);
			_play.addEventListener(MouseEvent.CLICK, onPlayClicked);
			_play.addEventListener(MouseEvent.MOUSE_DOWN, onButtonDown);
			_play.addEventListener(MouseEvent.MOUSE_OVER, onButtonDown);
			_play.addEventListener(MouseEvent.MOUSE_UP, onButtonUp);
			_play.addEventListener(MouseEvent.MOUSE_OUT, onButtonUp);
			_play.x = (panel.width - _play.width )/ 2;
			_play.y = panel.height - _play.height - 50;
			
			addChild(_background);
			addChild(overlay);
			addChild(panel);
			panel.addChild(_play);
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
		
		private function onPlayClicked(event : MouseEvent):void
		{
			Game.getInstance().showScene(SceneNames.MAIN_SCENE_NAME);
		}
		
	}
}