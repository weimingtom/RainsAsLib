﻿package me.rainssong.manager 
{
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import flash.filesystem.File;
	import flash.utils.Dictionary;
	import me.rainssong.net.ResumeDownloader;
	import me.rainssong.utils.StringCore;

	
	/**
	 * ...
	 * @author rainssong
	 */
	public class DownloadManager extends EventDispatcher 
	{
		private var _downloaderDic:Dictionary = new Dictionary();
		
		public function DownloadManager() 
		{
			
		}
		
		public function getDownloader(sourceUrl:String):ResumeDownloader
		{
			sourceUrl=sourceUrl.split("?")[0]
			return _downloaderDic[sourceUrl];
		}
		
		public function addDownload(sourceUrl:String,targetUrl:String=null):ResumeDownloader
		{
			sourceUrl=sourceUrl.split("?")[0]
			
			if (!targetUrl || targetUrl == "") 
			{
				
				targetUrl =File.applicationStorageDirectory.resolvePath(StringCore.webToLocal(sourceUrl)).nativePath;
			}
			if (getDownloader(targetUrl) && getDownloader(targetUrl).isDownloading)
			{
				trace(this +targetUrl+ "已经在下载了!");
				return getDownloader(targetUrl);
			}
			
			var downloader:ResumeDownloader = new ResumeDownloader();
			downloader.download(sourceUrl, targetUrl);
			downloader.addEventListener(Event.COMPLETE, onComplete);
			_downloaderDic[sourceUrl] = downloader;
			
			return downloader;
			//_cookie.data.downloadUrlArr = _downloaderArr;
		}
		
		private function onComplete(e:Event):void 
		{
			if (!isDownloading)
				dispatchEvent(new Event(Event.COMPLETE));
		}
		
		public function get  isDownloading():Boolean 
		{
			for each (var i:ResumeDownloader in  _downloaderDic)
			{
				if (!i.isFinished)
				{
					return true;
				}
			}
			return false;
		}
		
	}

}