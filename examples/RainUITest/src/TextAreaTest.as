package 
{
	import flash.display.Shape;
	import flash.geom.Rectangle;
	import flash.utils.setTimeout;
	import me.rainssong.utils.Align;
	import me.rainssong.utils.Color;
	import me.rainssong.utils.Draw;
	import me.rainui.components.List;
	import me.rainui.components.ListItem;
	import me.rainui.components.Page;
	import me.rainui.components.ScrollContainer;
	import me.rainui.components.ScrollText;
	import me.rainui.components.TextArea;
	import me.rainui.components.TextInput;
	import me.rainui.RainTheme;
	import me.rainui.RainUI;
	
	
	/**
	 * @date 2015/5/25 19:17
	 * @author rainssong
	 * @blog http://blog.sina.com.cn/rainssong
	 * @homepage http://rainsgameworld.sinaapp.com
	 * @weibo http://www.weibo.com/rainssong
	 */
	public class TextAreaTest extends Page 
	{
		public var ta:TextArea
		public function TextAreaTest() 
		{
			super();
			
			
			setTimeout(init, 200);
			
			
		}
		
		private function init():void 
		{
			RainUI.init(stage,new RainTheme("none"));
			//var a:TextArea=new TextArea("唧唧复唧唧，木兰当户织。不闻机杼声，惟闻女叹息。(惟闻 通：唯)　　问女何所思，问女何所忆。女亦无所思，女亦无所忆。昨夜见军帖，可汗大点兵，军书十二卷，卷卷有爷名。阿爷无大儿，木兰无长兄，愿为市鞍马，从此替爷征。\\r\\r　　东市买骏马，西市买鞍鞯，南市买辔头，北市买长鞭。旦辞爷娘去，暮宿黄河边，不闻爷娘唤女声，但闻黄河流水鸣溅溅。旦辞黄河去，暮至黑山头，不闻爷娘唤女声，但闻燕山胡骑鸣啾啾。\\r\\r　　万里赴戎机，关山度若飞。朔气传金柝，寒光照铁衣。将军百战死，壮士十年归。\\r\\r　　归来见天子，天子坐明堂。策勋十二转，赏赐百千强。可汗问所欲，木兰不用尚书郎，愿驰千里足，送儿还故乡。(一作：愿借明驼千里足)\\r\\r　　爷娘闻女来，出郭相扶将；阿姊闻妹来，当户理红妆；小弟闻姊来，磨刀霍霍向猪羊。开我东阁门，坐我西阁床，脱我战时袍，著我旧时裳。当窗理云鬓，对镜贴花黄。出门看火伴，火伴皆惊忙：同行十二年，不知木兰是女郎。（贴 通：帖；惊忙 一作：惶）\\r\\r　　雄兔脚扑朔，雌兔眼迷离；双兔傍地走，安能辨我是雄雌？", { parent:stage,x:100,y:100 } );
			var a:TextArea=new TextArea("唧唧复唧唧", { parent:stage,x:100,y:100 } );
			a.height = 400;
			a.width = 400;
		}
		
		
		
		
	}

}