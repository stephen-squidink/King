package com.game.core
{
	import flash.display.Sprite;
	
	public class GameObject extends Sprite
	{
		private var _isInitialised : Boolean = false;
		private var _isDestroy : Boolean = false;
		
		
		public function get isInitialised():Boolean
		{
			return _isInitialised;
		}
		
		public function get isDestroy():Boolean
		{
			return _isDestroy;
		}
		
		public function set isDestroy(value:Boolean):void
		{
			_isDestroy = value;
		}
		
		public function GameObject(autoInitalise : Boolean = false)
		{
			super();
			
			if(autoInitalise)
			{
				this.initialise();
			}
		}
		
		//Initialise your objects
		public function initialise() : void
		{
			_isInitialised = true;
		}
		
		//loop and update every frame
		public function update():void
		{
			
		}
		
		//Clean the gameobject and dispose its children
		public function dispose():void
		{
			
		}
	}
}