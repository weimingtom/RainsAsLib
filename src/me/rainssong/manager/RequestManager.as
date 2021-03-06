package me.rainssong.manager
{
	import flash.events.ErrorEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.events.IOErrorEvent;
	import flash.events.TimerEvent;
	import flash.net.NetworkInfo;
	import flash.net.NetworkInterface;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.net.URLRequestMethod;
	import flash.net.URLVariables;
	import flash.net.navigateToURL;
	import flash.utils.Dictionary;
	import flash.utils.Timer;
	import me.rainssong.events.ObjectEvent;
	import me.rainssong.events.RequestEvent;
	import me.rainssong.events.RequestIOErrorEvent;
	import me.rainssong.utils.RevDictionary;
	
	/**
	 * ...
	 * @author rainssong
	 */
	public class RequestManager extends EventDispatcher
	{
		private static const _loaderDic:Dictionary = new Dictionary();
		static private const _loaderRevDic:Dictionary = new Dictionary();
		static private const _timerDic:RevDictionary = new RevDictionary(true);
		
		public function RequestManager()
		{
		
		}
		
		private function onError(e:IOErrorEvent):void
		{
			var url:String = _loaderRevDic[e.target];
			//var timer:Timer = _timerDic.getValue(url) as Timer;
			//timer.stop();
			dispatchEvent(new RequestIOErrorEvent(e.type, url, e.bubbles, e.cancelable,e.text,e.errorID));
		}
		
		private function onComplete(e:Event):void
		{
			var url:String = _loaderRevDic[e.target];
			var data:Object = e.target.data;
			//var timer:Timer = _timerDic.getValue(url)  as Timer;
			//timer.stop();
			dispatchEvent(new RequestEvent(e.type, url, data, e.bubbles, e.cancelable));
			
		}
		
		public function hasLoader(url:String):Boolean
		{
			return _loaderDic[url];
		}
		
		public function getLoader(url:String):URLLoader
		{
			return _loaderDic[url];
		}
		
		public function createLoader(url:String):URLLoader
		{
			var loader:URLLoader = new URLLoader()
			_loaderDic[url] = loader;
			_loaderRevDic[loader] = url;
			var timer:Timer= new Timer(1000 * 10, 1);
			_timerDic.setValue(url, timer);
			
			loader.addEventListener(Event.COMPLETE, onComplete);
			loader.addEventListener(IOErrorEvent.IO_ERROR, onError);
			//loader.addEventListener(IOErrorEvent.NETWORK_ERROR, onError);
			//timer.addEventListener(TimerEvent.TIMER_COMPLETE, onTimer);
			
			return loader;
		}
		
		private function onTimer(e:TimerEvent):void 
		{
			var timer:Timer = e.currentTarget as Timer;
			var url:String = _timerDic.getKey(timer);
			dispatchEvent(new RequestIOErrorEvent(IOErrorEvent.IO_ERROR, url, e.bubbles, e.cancelable,"time up"));
		}
		
		public function destroyLoader(url:String):void
		{
			var loader:URLLoader = _loaderDic[url];
			if (loader == null)
				return;
				
			loader.close();
			loader.removeEventListener(Event.COMPLETE, onComplete);
			loader.removeEventListener(IOErrorEvent.IO_ERROR, onError);
			_loaderDic[url] = null;
			//var timer:Timer = _timerDic.getValue(url);
			//timer.removeEventListener(TimerEvent.TIMER_COMPLETE, onTimer);
		}
		
		public function sendRequest(data:Object, url:String, type:String = URLRequestMethod.POST,delay:Number=10000):void
		{
			
			//if (!NetworkInfo.isSupported )
			//{
				//dispatchEvent(new RequestIOErrorEvent(IOErrorEvent.IO_ERROR, url,false,false,"NetworkInfo not supported"));
				//powerTrace("无网络");
				//return;
			//}
			
			if (!hasLoader(url))
				createLoader(url);
			//MonsterDebugger.log("sendRequest:" , data, url, type);
			
			
			
			var request:URLRequest = new URLRequest(url);
			
			request.method = type;
			
			
			if (type == URLRequestMethod.GET)
			{
				var uv:URLVariables = new URLVariables();
				
				for (var i:String in data)
					uv[i] = data[i];
				
				request.data = uv;
				
			}
			else
			{
				request.data = JSON.stringify(data);
				request.contentType = "application/json";
			}
			
			//powerTrace(url, JSON.stringify(data));
			_loaderDic[url].load(request);
			
			//var timer:Timer = _timerDic.getValue(url)  as Timer;
			//timer.delay = delay;
			//timer.reset();
			//timer.start();
		}
	}

}