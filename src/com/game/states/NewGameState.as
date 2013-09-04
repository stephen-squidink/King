package com.game.states
{
	import com.game.core.GameScene;
	import com.game.core.state.IState;
	import com.game.objects.Gem;
	import com.game.scenes.MainScene;
	import com.util.constants.Constants;
	import com.util.player.Player;
	
	public class NewGameState implements IState
	{
		public function update(scene:GameScene):void
		{
			var isComplete : Boolean = true;
			var gemTo : Number = 0;
			
			for each(var gem : Gem in scene.objectPool)
			{
				gemTo = gem.rowIndex * Constants.GEM_HEIGHT;
				
				if(gem.y != gemTo)
				{
					gem.y += Constants.GEM_FALLING_SPEED + (Constants.GEM_SPEED_VARIENT * (gem.index / scene.objectPool.length));
					
					if(gem.y > gemTo)
					{
						gem.y = gemTo;
					}
					
					isComplete = false;
				}
			}
			
			if(isComplete)
			{
				MainScene.changeState(new SelectGemState());
				
				Player.getInstance().startGame();
			}
		}
	}
}