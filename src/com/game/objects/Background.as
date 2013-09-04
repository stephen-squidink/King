package com.game.objects
{
	import com.game.core.GameObject;
	
	import flash.display.Bitmap;
	
	import assets.AssetEmbed;
	
	public class Background extends GameObject
	{
		private var _asset : Bitmap;
		
		public function Background(autoInitalise:Boolean=false)
		{
			super(autoInitalise);
		}
		
		override public function initialise():void
		{
			super.initialise();
			
			_asset = new AssetEmbed.BACKGROUND();
			
			addChild(_asset);
		}
	}
}