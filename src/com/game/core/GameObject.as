package com.game.core
{
	import flash.display.Sprite;
	
	public class GameObject extends Sprite
	{
		private var _isInitialized : Boolean = false;
		private var _isDestroy : Boolean = false;
		
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
			
		}
		
		//loop and update every frame
		public function update():void
		{
			
		}
		
		//Clean the gameobject and dispose its children
		public function dispose():void
		{
			
		}
		
		public function get isInitialized():Boolean
		{
			return _isInitialized;
		}
		
		public function get isDestroy():Boolean
		{
			return _isDestroy;
		}
		
		public function set isDestroy(value:Boolean):void
		{
			_isDestroy = value;
		}
	}
}