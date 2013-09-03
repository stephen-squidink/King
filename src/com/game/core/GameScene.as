package com.game.core
{
	import com.game.objects.Gem;
	
	import flash.display.Sprite;

	public class GameScene extends Sprite
	{
		private var _isInitialised : Boolean = false;
		private var _framecount : int = 0;
		private var _objectPool : Array;
		
		public function GameScene()
		{
			super();
			
			_objectPool = [];
		}
		
		//Initialise your objects
		public function initialise() : void
		{
			_isInitialised = true;
		}
		
		//loop and update every frame
		public function update():void
		{
			_framecount++;
			
			for (var i : int = _objectPool.length - 1; i >= 0; i--)
			{
				GameObject(_objectPool[i]).update();
				
				if(GameObject(_objectPool[i]).isDestroy)
				{
					destroyGameObject(i);
				}
			}
		}
		
		//Clean the gameobject and dispose its children
		public function dispose():void
		{
			
		}
		
		public function reset():void
		{
			
		}
		
		protected function addObjectToPool(go : GameObject, autoAddChild : Boolean = false):void
		{
			_objectPool.push(go);
			
			if(autoAddChild)
			{
				addChild(go);
			}
		}
		
		protected function clearPool():void
		{
			for (var i : int = objectPool.length - 1; i >= 0; i--)
			{
				destroyGameObject(i);
			}
		}
		
		public function get objectPool():Array
		{
			return _objectPool;
		}
		
		private function destroyGameObject(index : int):void
		{
			GameObject(_objectPool[index]).parent.removeChild(GameObject(_objectPool[index]));
			GameObject(_objectPool[index]).dispose();
			
			_objectPool.splice(index,1);
		}
		
		public function get framecount():int
		{
			return _framecount;	
		}
		
		public function set framecount(value : int):void
		{
			_framecount = value;	
		}
		
		public function get isIntialised():Boolean	
		{
			return _isInitialised
		}
	}
}