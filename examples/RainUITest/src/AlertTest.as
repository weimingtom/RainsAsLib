package 
{
	import flash.display.Shape;
	import flash.geom.Rectangle;
	import flash.utils.setTimeout;
	import me.rainssong.utils.Align;
	import me.rainssong.utils.Color;
	import me.rainssong.utils.Draw;
	import me.rainui.components.Alert;
	import me.rainui.components.List;
	import me.rainui.components.ListItem;
	import me.rainui.components.Page;
	import me.rainui.events.RainUIEvent;
	import me.rainui.RainTheme;
	import me.rainui.RainUI;
	
	
	/**
	 * @date 2015/5/25 19:17
	 * @author rainssong
	 * @blog http://blog.sina.com.cn/rainssong
	 * @homepage http://rainsgameworld.sinaapp.com
	 * @weibo http://www.weibo.com/rainssong
	 */
	public class AlertTest extends Page 
	{
		
		public function AlertTest() 
		{
			super();
			
			RainUI.init(stage,new RainTheme);
			
			setTimeout(init,200)
		}
		
		private function init():void 
		{
			Alert.show("message", "title");
		}
		
		
		
		
		
	}

}