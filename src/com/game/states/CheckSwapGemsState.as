package com.game.states
{
	import com.game.core.GameScene;
	import com.game.core.state.IState;
	import com.game.scenes.MainScene;
	import com.util.GemUtil;
	import com.util.constants.Direction;
	
	public class CheckSwapGemsState implements IState
	{
		public function update(scene:GameScene):void
		{
			if( GemUtil.checkForMatches(MainScene(scene).selectedGem, Direction.UP) ||
				GemUtil.checkForMatches(MainScene(scene).selectedGem, Direction.DOWN) ||
				GemUtil.checkForMatches(MainScene(scene).selectedGem, Direction.LEFT) ||
				GemUtil.checkForMatches(MainScene(scene).selectedGem, Direction.RIGHT) ||
				GemUtil.checkForMatches(MainScene(scene).swapGem, Direction.UP) ||
				GemUtil.checkForMatches(MainScene(scene).swapGem, Direction.DOWN) ||
				GemUtil.checkForMatches(MainScene(scene).swapGem, Direction.LEFT) ||
				GemUtil.checkForMatches(MainScene(scene).swapGem, Direction.RIGHT))
			{
				MainScene.getInstance().resetGems();
				MainScene.changeState(new CheckMatchingGemsState());
			}
			else
			{
				trace("swap back");	
			}
		}
	}
}