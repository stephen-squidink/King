package assets
{
	import flash.display.Bitmap;

	public final class AssetEmbed
	{
		[Embed(source="Background.jpg")]
		public static const BACKGROUND:Class;
		public static const BACKGROUND_BITMAP : Bitmap = new BACKGROUND();
		
		[Embed(source="Blue.png")]
		public static const BLUE_GEM:Class;
		public static const BLUE_GEM_BITMAP : Bitmap = new BLUE_GEM();
		
		[Embed(source="Green.png")]
		public static const GREEN_GEM:Class;
		public static const GREEN_GEM_BITMAP : Bitmap = new GREEN_GEM();
		
		[Embed(source="Purple.png")]
		public static const PURPLE_GEM:Class;
		public static const PURPLE_GEM_BITMAP : Bitmap = new PURPLE_GEM();
		
		[Embed(source="Red.png")]
		public static const RED_GEM:Class;
		public static const RED_GEM_BITMAP : Bitmap = new RED_GEM();
		
		[Embed(source="Yellow.png")]
		public static const YELLOW_GEM:Class;
		public static const YELLOW_GEM_BITMAP : Bitmap = new YELLOW_GEM();
	}
}