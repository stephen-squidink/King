package com.game.states
{
	import com.game.core.GameScene;
	import com.game.core.state.IState;
	import com.game.objects.Gem;
	import com.game.scenes.MainScene;
	import com.util.constants.Constants;
	
	public class CreateNewGemsState implements IState
	{
		private var columnCounts : Array;
		
		public function update(scene:GameScene):void
		{
			if(!columnCounts)
			{ 
				columnCounts = new Array();
			
				for (var i : int = 0; i < Constants.MAX_COL_COUNT; i++)
				{
					columnCounts.push(Constants.MAX_COL_COUNT);
					
					for each(var gem : Gem in scene.objectPool)
					{
						if(gem.colIndex == i)
						{
							columnCounts[i]--;
						}
					}
				}
			}
			
			createGems();
		}
		
		private function createGems():void
		{
			for (var i : int = 0; i < columnCounts.length; i++)
			{
				if(columnCounts[i] < Constants.MAX_COL_COUNT)
				{
					for (var j : int = 0; j < columnCounts[i]; j++)
					{
						MainScene.getInstance().createGem(i + (j * Constants.MAX_COL_COUNT),j,i);
					}
				}
			}
			
			MainScene.changeState(new MoveNewGemsState());
		}
	}
}