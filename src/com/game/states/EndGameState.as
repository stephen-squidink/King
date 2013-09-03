package com.game.states
{
	import com.game.Game;
	import com.game.core.GameScene;
	import com.game.core.state.IState;
	import com.util.GemUtil;
	import com.util.constants.SceneNames;
	
	public class EndGameState implements IState
	{
		public function update(scene:GameScene):void
		{
			GemUtil.clearGemFilters();
			
			Game.getInstance().showScene(SceneNames.END_SCENE_NAME);
		}
	}
}