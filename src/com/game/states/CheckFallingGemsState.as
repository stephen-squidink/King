package com.game.states
{
	import com.game.core.GameScene;
	import com.game.core.state.IState;
	import com.game.objects.Gem;
	import com.game.scenes.MainScene;
	import com.util.constants.Constants;

	public class CheckFallingGemsState implements IState
	{
		private var _columns : Array = [];
		private var _keepChecking : Boolean;
		
		public function CheckFallingGemsState(keepChecking : Boolean)
		{
			_keepChecking = keepChecking;
		}
		
		public function update(scene:GameScene):void
		{
			_columns = [];
			
			for (var i : int = 0; i < scene.objectPool.length; i++)
			{
				if(!Gem(scene.objectPool[i]).visible)
				{
					if(checkNumColumns(Gem(scene.objectPool[i]).colIndex))
					{
						for each(var o : Object in _columns)
						{
							if(o.colIndex == Gem(scene.objectPool[i]).colIndex)
							{
								o.numRows++;
		
								break;
							}
						}
					}
					else 
					{
						_columns.push({colIndex: Gem(scene.objectPool[i]).colIndex, rowIndex: Gem(scene.objectPool[i]).rowIndex, numRows:1});
					}
				}
			}
			
			if(_columns.length > 0)
			{
				moveGems();
			}
			else
			{
				disposeGems();
				
				if(_keepChecking)
				{
					MainScene.changeState(new CheckMatchingGemsState());	
				}
				else
				{
					MainScene.changeState(new CreateNewGemsState());	
				}
			}
		}
		
		private function moveGems():void
		{	
			var isCompleted : Boolean = true;
			var gem : Gem;
			
			for (var i : int = MainScene.getInstance().objectPool.length - 1; i >= 0; i--)
			{
				gem = MainScene.getInstance().objectPool[i];
				
				var column : Object = checkMatchingCol(gem.colIndex);
				
				if(column && (gem.rowIndex < column.rowIndex))
				{
					var rowIndexTo : int = gem.rowIndex + column.numRows;
					
					if(gem.y != rowIndexTo * Constants.GEM_HEIGHT)
					{
						gem.y += 20;
						
						isCompleted = false;
					}
					else
					{
						gem.updateGem(8 * rowIndexTo, rowIndexTo, gem.colIndex);
					}
				}
			}
				
			if(isCompleted)
			{
				disposeGems();
			}
		}
		
		private function disposeGems():void
		{
			var gem : Gem;
			
			for (var i : int = MainScene.getInstance().objectPool.length - 1; i >= 0; i--)
			{
				gem = Gem(MainScene.getInstance().objectPool[i]);
				
				if(!gem.visible)
				{
					gem.isDestroy = true;
				}
			}
		}
			
		private function checkMatchingCol(colIndex : int):Object
		{
			for each(var col : Object in _columns)
			{
				if(col.colIndex == colIndex)
				{
					return col;
				}
			}
			
			return null;	
		}
		
		private function checkNumColumns(colIndex : int):Boolean
		{
			for each(var o : Object in _columns)
			{
				if(o.colIndex == colIndex)
				{
					return true;
				}
			}
			
			return false;
		}
	}
}