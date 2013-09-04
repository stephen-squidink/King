package com.util
{
	import com.game.objects.Gem;
	import com.game.scenes.MainScene;
	import com.util.constants.Constants;
	import com.util.constants.Direction;
	
	import flash.utils.Dictionary;

	public class GemUtil
	{
		public static function clearGemFilters():void
		{
			for each(var gem : Gem in MainScene.getInstance().objectPool)
			{
				gem.filters = [];	
			}
		}
		
		public static function checkForMatches(gem : Gem, direction : int):Boolean
		{
			var isMathcing : Boolean = true;
			var currentGem : Gem;
			var matchingGem : Array = [];
			matchingGem.push(gem);
			
			while(isMathcing)
			{
				currentGem = getGem(matchingGem[matchingGem.length - 1].rowIndex, matchingGem[matchingGem.length - 1].colIndex, direction);
				
				if(currentGem != null)
				{
					if(currentGem.type == gem.type)
					{	
						isMathcing = true;
						
						matchingGem.push(currentGem);
					}
					else
					{
						isMathcing = false;
					}
				}
				else
				{
					isMathcing = false;
				}
			}
			
			if(matchingGem.length >= 3)
			{
				for each(var g : Gem in matchingGem)
				{
					g.visible = false;
				}
				
				return true;
			}
			
			return false;
		}
		
		public static function getGemGroup(gem : Gem):Dictionary
		{
			var group : Dictionary = new Dictionary();
			
			group[Direction.UP] = getGem(gem.rowIndex, gem.colIndex, Direction.UP);
			group[Direction.DOWN] = getGem(gem.rowIndex, gem.colIndex, Direction.DOWN);
			group[Direction.LEFT] = getGem(gem.rowIndex, gem.colIndex, Direction.LEFT);
			group[Direction.RIGHT] = getGem(gem.rowIndex, gem.colIndex, Direction.RIGHT);
			
			return group;
		}
		
		public static function validateCanvasWithGem(gem : Gem):void
		{
			var gemUp : Gem = getGem(gem.rowIndex, gem.colIndex, Direction.UP);
			var gemDown : Gem = getGem(gem.rowIndex, gem.colIndex, Direction.DOWN);
			var gemLeft : Gem = getGem(gem.rowIndex, gem.colIndex, Direction.LEFT);
			var gemRight : Gem = getGem(gem.rowIndex, gem.colIndex, Direction.RIGHT);
			
			var type : int = gem.type;
			
			while((gemUp && gem.type == gemUp.type) || (gemDown && gem.type == gemDown.type) || (gemLeft && gem.type == gemLeft.type) || (gemRight && gem.type == gemRight.type))
			{
				while(gem.type == type)
				{
					type = Math.floor(Math.random() * Constants.MAX_TYPE_COUNT);
				}
				
				gem.changeGem(type);
			}
		}
		
		public static function getGem(row : int, col : int, direction : int):Gem
		{
			for each(var gem : Gem in MainScene.getInstance().objectPool)
			{
				if(direction == Direction.UP)
				{
					if(row - 1 >= 0)
					{
						if(gem.rowIndex == row - 1 && gem.colIndex == col)
						{
							return gem;
						}
					}
					else 
					{
						break;
					}
				}
				else if(direction == Direction.DOWN)
				{
					if(row + 1 < Constants.MAX_ROW_COUNT)
					{
						if(gem.rowIndex == row + 1 && gem.colIndex == col)
						{
							return gem;
						}
					}
					else
					{
						break;
					}
				}
				else if(direction == Direction.LEFT)
				{
					if(col - 1 >= 0)
					{
						if(gem.colIndex == col - 1 && gem.rowIndex == row)
						{
							return gem;
						}
					}
					else
					{
						break;
					}
				}
				else if(direction == Direction.RIGHT)
				{
					if(col + 1 < Constants.MAX_COL_COUNT)
					{
						if(gem.colIndex == col + 1 && gem.rowIndex == row)
						{
							return gem;
						}
					}
					else
					{
						break;
					}
				}
				
			}
			
			return null;
		}
	}
}