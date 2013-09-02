package com.util.constants
{
	import flash.filters.GlowFilter;

    public class Constants
    {
		public static const BOARD_X : int = 337;
		public static const BOARD_Y : int = 110;
    	public static const BOARD_WIDTH : int = 320;
		public static const BOARD_HEIGHT : int = 320;
		
		public static const GEM_WIDTH : int = 40;
		public static const GEM_HEIGHT : int = 40;
		
		public static const GLOW_HIGHLIGHT : GlowFilter = new GlowFilter(0xFFFFFF, 1,5,5,5,2);
    }
}