/*
 * Copyright 2007-2009 (c) Donovan Adams, http://blog.hydrotik.com/
 *
 * Permission is hereby granted, free of charge, to any person
 * obtaining a copy of this software and associated documentation
 * files (the "Software"), to deal in the Software without
 * restriction, including without limitation the rights to use,
 * copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following
 * conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
 * EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
 * OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
 * NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
 * HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
 * OTHER DEALINGS IN THE SOFTWARE.
 */


package com.hydrotik.queueloader.items {
	import flash.display.BitmapData;
	import flash.display.Loader;
	import flash.events.Event;
	import flash.events.HTTPStatusEvent;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	
	import com.hydrotik.queueloader.AbstractItem;
	import com.hydrotik.queueloader.ILoadable;		

	/**
	 * @author Donovan Adams | Hydrotik | http://blog.hydrotik.com
	 * @version: 3.2.0
	 */
	public class SWFItem extends AbstractItem implements ILoadable {

		protected var _bmFrames:int;
		
		protected var _currFrame : int;
		
		protected var _tempEvent : Event;
		
		protected var _drawFrames : Boolean = false;
		
		protected var _center : Boolean = false;

		public function SWFItem(path : URLRequest, container : *, info : Object, loaderContext : LoaderContext, fileType:int) {
			super(path, container, info, loaderContext, fileType);
			if(info["title"] != null) _title = _info.title;
			if(info["drawFrames"] != null) _drawFrames = _info.drawFrames;
			if(info["center"] != null) _center = _info.center;
		}

		public override function load() : void {
			_loader = new Loader();
			_loader.contentLoaderInfo.addEventListener(Event.COMPLETE, preCompleteProcess);
			_loader.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS, _httpStatusFunction);
			_loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, _errorFunction);
			_loader.contentLoaderInfo.addEventListener(Event.OPEN, _openFunction);
			_loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, _progressFunction);
			_target = _loader;
			_loader.load(_path, _loaderContext);
		}

		public override function stop() : void {
			try{Loader(_loader).close();}catch(e:Error){};
			deConfigureListeners();
		}

		public override function dispose() : void {
			stop();
			while(_bmArray.length > 0) {
				var item:BitmapData = _bmArray.pop();
				item.dispose();
				item = null;
			}
			Loader(_loader).unload();
			_progress = 0;
			_bytesLoaded = 0;
			_bytesTotal = 0;
			_container = null;
			_target = null;
			_content = null;
			_message = null;
			_path = null;
			_title = null;
			_index = 0;
			_isLoading = false;
			_fileType = 0;
			_loader = null;
			_openFunction = null;
			_httpStatusFunction = null;
			_errorFunction = null;
			_completeFunction = null;
			_progressFunction = null;
			_info = null;
			_width = 0;
			_height = 0;
			_bitmap = null;
			_bmArray = null;
			_bmFrames = 0;
			_currFrame = 0;
			_tempEvent = null;
			_center = false;
		}

		public function deConfigureListeners() : void {
			if(_loader.contentLoaderInfo.hasEventListener(ProgressEvent.PROGRESS)) _loader.contentLoaderInfo.removeEventListener(ProgressEvent.PROGRESS, _progressFunction);
			if(_loader.contentLoaderInfo.hasEventListener(Event.COMPLETE)) _loader.contentLoaderInfo.removeEventListener(Event.COMPLETE, preCompleteProcess);
			if(_loader.contentLoaderInfo.hasEventListener(HTTPStatusEvent.HTTP_STATUS)) _loader.contentLoaderInfo.removeEventListener(HTTPStatusEvent.HTTP_STATUS, _httpStatusFunction);
			if(_loader.contentLoaderInfo.hasEventListener(IOErrorEvent.IO_ERROR)) _loader.contentLoaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, _errorFunction);
			if(_loader.contentLoaderInfo.hasEventListener(Event.OPEN)) _loader.contentLoaderInfo.removeEventListener(Event.OPEN, _openFunction);
		}
		
		protected override function preCompleteProcess(event:Event):void{
			_target = event.target.loader;
			_content = event.target.loader.content;
			_width = _target.width;
			_height = _target.height;
			if(_center){
				_target.x = -(_target.width/2);
				_target.y = -(_target.height/2);
			}
			if(_container != null) _container.addChild(_target);
			_tempEvent = event;
			if(_drawFrames){
				drawSWFFrames();
			}else{
				_completeFunction(event);
			}
		}
		
		/******* PRIVATE ********/
		
		private function drawSWFFrames() : void {
			_bmArray = new Array();
			_bmFrames = _content.totalFrames;
			_content.stop();
			drawFrame(1);
		}

		private function drawFrame(frame:int) : void {
			_content.gotoAndStop(frame);
			
			var bd : BitmapData = new BitmapData(_content.width, _content.height, true, 0xFFFF0000);
			bd.draw(_content);
			_bmArray.push(bd);
			if(frame == _bmFrames) {
				_completeFunction(_tempEvent);
				return;
			}else {
				drawFrame(frame + 1);
			}
		}
	}
}
