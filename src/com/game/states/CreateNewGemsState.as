package com.game.states
{
	import com.game.core.GameScene;
	import com.game.core.state.IState;
	import com.game.objects.Gem;
	import com.game.scenes.MainScene;
	
	public class CreateNewGemsState implements IState
	{
		private var columnCounts : Array;
		
		public function update(scene:GameScene):void
		{
			if(!columnCounts)
			{ 
				columnCounts = new Array();
			
				for (var i : int = 0; i < 8; i++)
				{
					columnCounts.push(8);
					
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
				if(columnCounts[i] < 8)
				{
					for (var j : int = 0; j < columnCounts[i]; j++)
					{
						MainScene.getInstance().createGem(i + (j * 8),j,i);
					}
				}
			}
			
			MainScene.changeState(new MoveNewGemsState());
		}
	}
}