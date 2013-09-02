package com.game.states
{
	import com.game.core.GameScene;
	import com.game.core.state.IState;
	import com.game.objects.Gem;
	import com.game.scenes.MainScene;
	import com.util.constants.Constants;
	
	public class MoveNewGemsState implements IState
	{
		public function update(scene:GameScene):void
		{
			var isComplete : Boolean = true;
			var speed : int = 50;
			
			for each(var gem : Gem in scene.objectPool)
			{
				if(gem.y != gem.rowIndex * Constants.GEM_HEIGHT)
				{
					gem.y += speed;
					
					if(gem.y > gem.rowIndex * Constants.GEM_HEIGHT)
					{
						gem.y = gem.rowIndex * Constants.GEM_HEIGHT;
					}
					
					isComplete = false;
				}
			}
			
			if(isComplete)
			{
				MainScene.changeState(new SelectGemState());
			}
		}
	}
}