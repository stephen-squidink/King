package com.game.scenes
{
	import com.game.core.GameScene;
	import com.game.core.state.IState;
	import com.game.objects.Background;
	import com.game.objects.GUI;
	import com.game.objects.Gem;
	import com.game.states.NewGameState;
	import com.game.states.SelectGemState;
	import com.game.states.SwapGemState;
	import com.util.GemUtil;
	import com.util.constants.Constants;
	import com.util.player.Player;
	
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.utils.Dictionary;

	public class MainScene extends GameScene
	{
		private static var _currentState : IState;
		
		private var _gui : GUI;
		private var _background : Background;
		private var _canvas : Sprite;
		
		private var _selectedGem : Gem;
		private var _swapGem : Gem;
		
		public function get selectedGem():Gem
		{
			return _selectedGem;
		}
		
		public function get swapGem():Gem
		{
			return _swapGem;
		}
	
		private static var _instance : MainScene = null;
		
		public static function getInstance():MainScene
		{
			if(_instance)
				return _instance;
			
			return null;
		}
		
		public function MainScene()
		{
			super();
			
			if(!_instance)
			{	
				_instance = this;
			}
		}
		
		override public function initialise():void
		{
			super.initialise();
				
			_background = new Background(true);
			
			_canvas = new Sprite();
			_canvas.x = Constants.BOARD_X;
			_canvas.y = Constants.BOARD_Y;
			
			var mask:Shape = new Shape();
			with(mask.graphics)
			{
				beginFill(0xFFFFFF, 1);
				drawRect(Constants.BOARD_X, Constants.BOARD_Y, Constants.BOARD_WIDTH, Constants.BOARD_HEIGHT);
				endFill();
			}
			_canvas.mask = mask;
			
			_gui = new GUI(true);
			
			addChild(_background);
			addChild(_canvas);
			addChild(_gui);
			
			createGems();
			
			changeState(new NewGameState());
		}
		
		override public function update():void
		{
			super.update();
			
			if(_gui)
			{
				_gui.update();
			}
			
			if(_currentState)
			{
				_currentState.update(this);
			}
		}
		
		private function createGems():void
		{
			for (var i : int = 0; i < 8; i++)
			{
				for(var j : int = 0; j < 8; j++)
				{
					createGem((i + 1) * j,i,j);
				}
			}
		}
		
		public function createGem(index : int, row : int, col: int):void
		{
			var type : int = Math.floor(Math.random()*5);
			var gem : Gem = new Gem(index, type, row, col, true);
			gem.addEventListener(MouseEvent.CLICK, onGemClicked);
			
			GemUtil.validateCanvasWithGem(gem);
			
			addObjectToPool(gem);
			
			_canvas.addChild(gem);
		}
		
		private function onGemClicked(event : MouseEvent):void
		{	
			if(_currentState is SelectGemState)
			{
				if(_selectedGem)
				{
					var group : Dictionary = GemUtil.getGemGroup(_selectedGem);
					var gem : Gem;
					
					for (var key : int in group)
					{
						gem = group[key];
						
						if(event.currentTarget == gem)
						{
							_swapGem = gem;
							
							var tempIndex : int = selectedGem.index;
							var tempRowIndex : int = selectedGem.rowIndex;
							var tempColIndex : int = selectedGem.colIndex;
							
							selectedGem.updateGem(swapGem.index, swapGem.rowIndex, swapGem.colIndex);
							swapGem.updateGem(tempIndex, tempRowIndex, tempColIndex);
							
							GemUtil.clearGemFilters();
							
							changeState(new SwapGemState(key));
							
							return;
						}
					}
				}
				
				GemUtil.clearGemFilters();
				_selectedGem = event.currentTarget as Gem;
				Gem(event.currentTarget).filters = [Constants.GLOW_HIGHLIGHT];	
			}
		}
		
		public static function changeState(state : IState):void
		{
			_currentState = state;
		}
		
		public function resetGems():void
		{
			_selectedGem = null;
			_swapGem = null;
		}
		
		override public function reset():void
		{
			super.reset();
			
			resetGems();
			Player.getInstance().reset();
	
			clearPool();
			createGems();
			changeState(new NewGameState());
		}

	}
}