package
{
	import com.game.Game;
	
	import flash.display.Sprite;
	
	[SWF(frameRate="60", backgroundColor="#000000", width="755", height="600")]
	public class ProjectKing extends Sprite
	{
		public function ProjectKing()
		{
			var game : Game = new Game();
			
			addChild(game);
		}
	}
}