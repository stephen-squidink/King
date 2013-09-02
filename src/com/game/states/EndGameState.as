package com.game.states
{
	import com.game.core.GameScene;
	import com.game.core.state.IState;
	import com.util.GemUtil;
	
	public class EndGameState implements IState
	{
		public function update(scene:GameScene):void
		{
			GemUtil.clearGemFilters();
		}
	}
}