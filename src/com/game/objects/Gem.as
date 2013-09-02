package com.game.objects
{
	import com.game.core.GameObject;
	import com.util.constants.Constants;
	import com.util.constants.GemTypes;
	
	import flash.display.Bitmap;
	
	import assets.AssetEmbed;
	
	public class Gem extends GameObject
	{
		private var _asset : Bitmap;
		private var _type : int = -1;
		private var _index : int = -1;
		private var _rowIndex : int;
		private var _colIndex : int;
		
		public function get rowIndex():int
		{
			return _rowIndex;
		}
		
		public function set rowIndex(value : int):void
		{
			_rowIndex = value;
		}
		
		public function get colIndex():int
		{
			return _colIndex;
		}
		
		public function set colIndex(value : int):void
		{
			_colIndex = value;
		}
		
		public function get type():int
		{
			return _type;
		}
		
		public function get index():int
		{
			return _index;
		}
		
		public function Gem(index : int, type : int, rowIndex : int, colIndex : int, autoInitalise:Boolean=false)
		{	
			_index = index;
			_type = type;
			_rowIndex = rowIndex;
			_colIndex = colIndex;
			
			super(autoInitalise);
		}
		
		override public function dispose():void
		{
			super.dispose();
			
			removeChild(_asset);
		}
		
		override public function initialise():void
		{
			super.initialise();
			
			with(this.graphics)
			{
				beginFill(0x000000, 0)
				drawRect(0,0,Constants.GEM_WIDTH,Constants.GEM_HEIGHT);
				endFill();
			}
		
			_asset = new Bitmap();
			changeGem(_type);
			addChild(_asset);
			
			this.x = _colIndex * Constants.GEM_WIDTH;
			this.y = _rowIndex * Constants.GEM_HEIGHT - Constants.BOARD_HEIGHT;
		}
		
		override public function update():void
		{
			super.update();
		}
		
		public function updateGem(index : int, row : int, col : int):void
		{
			_index = index;
			_rowIndex = row;
			_colIndex = col;
		}
		
		public function changeGem(type : int):void
		{
			_type = type;
			
			switch(_type)
			{
				case GemTypes.BLUE_GEM:
					_asset.bitmapData = AssetEmbed.BLUE_GEM_BITMAP.bitmapData;
					break;
				case GemTypes.GREEN_GEM:
					_asset.bitmapData = AssetEmbed.GREEN_GEM_BITMAP.bitmapData;
					break;
				case GemTypes.PURPLE_GEM:
					_asset.bitmapData = AssetEmbed.PURPLE_GEM_BITMAP.bitmapData;
					break;
				case GemTypes.RED_GEM:
					_asset.bitmapData = AssetEmbed.RED_GEM_BITMAP.bitmapData;
					break;
				case GemTypes.YELLOW_GEM:
					_asset.bitmapData = AssetEmbed.YELLOW_GEM_BITMAP.bitmapData;
					break;
			}
			
			_asset.x = (Constants.GEM_WIDTH - _asset.width) / 2;
			_asset.y = (Constants.GEM_HEIGHT - _asset.height) / 2;
		}
		
	}
}