package com.game.states
{
	import com.game.core.GameScene;
	import com.game.core.state.IState;
	import com.game.objects.Gem;
	import com.game.scenes.MainScene;
	import com.util.GemUtil;
	import com.util.constants.Direction;
	import com.util.player.Player;
	
	import flash.utils.Dictionary;
	
	public class CheckMatchingGemsState implements IState
	{
		private var _keepChecking : Boolean = false;
		private var _isInitialCheck : Boolean = false;
		
		public function CheckMatchingGemsState(isInitial : Boolean = false)
		{
			_isInitialCheck = isInitial;
		}
		
		public function update(scene:GameScene):void
		{
			for (var i : int = 0; i < MainScene(scene).objectPool.length; i++)
			{
				if(	GemUtil.checkForMatches(MainScene(scene).objectPool[i] as Gem, Direction.UP) ||
					GemUtil.checkForMatches(MainScene(scene).objectPool[i] as Gem, Direction.DOWN) ||
					GemUtil.checkForMatches(MainScene(scene).objectPool[i] as Gem, Direction.LEFT) ||
					GemUtil.checkForMatches(MainScene(scene).objectPool[i] as Gem, Direction.RIGHT))
				{
					_keepChecking = true;
					
					Player.getInstance().addScore((Gem(MainScene(scene).objectPool[i]).type + 1) * 10);
					
					break
				}
				else
				{
					_keepChecking = false;
				}
			}
			
			if(_isInitialCheck)
			{
				if(!_keepChecking)
				{
					var group : Dictionary = GemUtil.getGemGroup(MainScene(scene).selectedGem);
					var gem : Gem;
					
					for (var key : int in group)
					{
						gem = group[key];
						
						if(MainScene(scene).swapGem == gem)
						{
							var tempIndex : int = MainScene(scene).selectedGem.index;
							var tempRowIndex : int = MainScene(scene).selectedGem.rowIndex;
							var tempColIndex : int = MainScene(scene).selectedGem.colIndex;
							
							MainScene(scene).selectedGem.updateGem(MainScene(scene).swapGem.index, MainScene(scene).swapGem.rowIndex, MainScene(scene).swapGem.colIndex);
							MainScene(scene).swapGem.updateGem(tempIndex, tempRowIndex, tempColIndex);
							
							GemUtil.clearGemFilters();
							
							MainScene.changeState(new SwapGemState(key, true));
							
							return;
						}
					}
				}
				else
				{
					MainScene(scene).resetGems();
				}
			}
			
			MainScene.changeState(new CheckFallingGemsState(_keepChecking));
		}
	}
}