package com.game.states
{
	import com.game.core.GameScene;
	import com.game.core.state.IState;
	import com.game.objects.Gem;
	import com.game.scenes.MainScene;
	import com.util.constants.Constants;
	import com.util.constants.Direction;
	
	public class SwapGemState implements IState
	{
		private var _direction : int;
		private var _isSwapBack : Boolean = false;
		
		public function SwapGemState(direction : int, isSwapBack : Boolean = false)
		{
			_direction = direction;
			_isSwapBack = isSwapBack;
		}
		
		public function update(scene:GameScene):void
		{
			var isComplete : Boolean = false;
			var selectedGem : Gem = MainScene(scene).selectedGem;
			var swapGem : Gem = MainScene(scene).swapGem;
			
			switch(_direction)
			{
				case Direction.UP:
					if(selectedGem.y != selectedGem.rowIndex * Constants.GEM_HEIGHT)
					{
						selectedGem.y -= Constants.GEM_SWAP_SPEED;
						
						if(selectedGem.y < selectedGem.rowIndex * Constants.GEM_HEIGHT)
						{
							selectedGem.y = selectedGem.rowIndex * Constants.GEM_HEIGHT;
						}
					}
					
					if(swapGem.y != swapGem.rowIndex * Constants.GEM_HEIGHT)
					{
						swapGem.y += Constants.GEM_SWAP_SPEED;
						
						if(swapGem.y > swapGem.rowIndex * Constants.GEM_HEIGHT)
						{
							swapGem.y = swapGem.rowIndex * Constants.GEM_HEIGHT;
						}
					}
					
					break;
				case Direction.DOWN:
					if(selectedGem.y != selectedGem.rowIndex * Constants.GEM_HEIGHT)
					{
						selectedGem.y += Constants.GEM_SWAP_SPEED;
						
						if(selectedGem.y > selectedGem.rowIndex * Constants.GEM_HEIGHT)
						{
							selectedGem.y = selectedGem.rowIndex * Constants.GEM_HEIGHT;
						}
					}
					
					if(swapGem.y != swapGem.rowIndex * Constants.GEM_HEIGHT)
					{
						swapGem.y -= Constants.GEM_SWAP_SPEED;
						
						if(swapGem.y < swapGem.rowIndex * Constants.GEM_HEIGHT)
						{
							swapGem.y = swapGem.rowIndex * Constants.GEM_HEIGHT;
						}
					}
					break;
				case Direction.LEFT:
					if(selectedGem.x != selectedGem.colIndex * Constants.GEM_WIDTH)
					{
						selectedGem.x -= Constants.GEM_SWAP_SPEED;
						
						if(selectedGem.y < selectedGem.rowIndex * Constants.GEM_HEIGHT)
						{
							selectedGem.y = selectedGem.rowIndex * Constants.GEM_HEIGHT;
						}
					}
					
					if(swapGem.x != swapGem.colIndex * Constants.GEM_WIDTH)
					{
						swapGem.x += Constants.GEM_SWAP_SPEED;
						
						if(swapGem.y > swapGem.rowIndex * Constants.GEM_HEIGHT)
						{
							swapGem.y = swapGem.rowIndex * Constants.GEM_HEIGHT;
						}
					}
					break;
				case Direction.RIGHT:
					if(selectedGem.x != selectedGem.colIndex * Constants.GEM_WIDTH)
					{
						selectedGem.x += Constants.GEM_SWAP_SPEED;
						
						if(selectedGem.y > selectedGem.rowIndex * Constants.GEM_HEIGHT)
						{
							selectedGem.y = selectedGem.rowIndex * Constants.GEM_HEIGHT;
						}
					}
					
					if(swapGem.x != swapGem.colIndex * Constants.GEM_WIDTH)
					{
						swapGem.x -= Constants.GEM_SWAP_SPEED;
						
						if(swapGem.y < swapGem.rowIndex * Constants.GEM_HEIGHT)
						{
							swapGem.y = swapGem.rowIndex * Constants.GEM_HEIGHT;
						}
					}
					
					break;
			}
			
			if(	(selectedGem.x == selectedGem.colIndex * Constants.GEM_WIDTH) &&
				(selectedGem.y == selectedGem.rowIndex * Constants.GEM_HEIGHT) &&
				(swapGem.x == swapGem.colIndex * Constants.GEM_WIDTH) && 
				(swapGem.y == swapGem.rowIndex * Constants.GEM_HEIGHT))
			{
				if(_isSwapBack)
				{
					MainScene(scene).resetGems();
					MainScene.changeState(new SelectGemState());
				}
				else
				{
					MainScene.changeState(new CheckMatchingGemsState(true));
				}
			}
		}
	}
}