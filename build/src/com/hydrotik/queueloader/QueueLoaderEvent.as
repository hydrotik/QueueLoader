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

package com.hydrotik.queueloader {
	import flash.net.URLRequest;	
	import flash.events.Event;

	/**
	 * @author Donovan Adams | Hydrotik | http://blog.hydrotik.com
	 * @version: 3.2.0
	 */
	public class QueueLoaderEvent extends Event {

		// Event types
		public static var ITEM_START : String = "itemStart";

		public static var ITEM_PROGRESS : String = "itemProgress";

		public static var ITEM_COMPLETE : String = "itemComplete";

		public static var ITEM_ERROR : String = "itemError";

		public static var ITEM_HTTP_STATUS : String = "itemHTTPStatus";
		
		public static var QUEUE_START : String = "queueStart";

		public static var QUEUE_PROGRESS : String = "queueProgress";

		public static var QUEUE_COMPLETE : String = "queueComplete";


		// Public properties
		public var container : *;
		
		public var targ : *;

		public var content : *;

		public var title : String = "";

		public var fileType : int;

		public var path : URLRequest;

		public var bytesLoaded : Number = -1;

		public var bytesTotal : Number = -1;	

		public var percentage : Number = 0;

		public var queuepercentage : Number = 0;

		public var index : int;	

		public var length : int;
		
		public var bandwidth:Number;

		public var queueBytes:Number;

		public var width : Number;

		public var height : Number;

		public var message : String = "";

		public var bmArray : Array;

		public var info : Object = null;

		public function QueueLoaderEvent( type : String, currItem:*, queuepercentage:Number, index:int, length:int, bandwidth:Number, queueBytes:Number, bubbles : Boolean = false, cancelable : Boolean = false) {
			super(type, bubbles, cancelable);
			this.container = (currItem.container == null) ? null : currItem.container;
			this.targ = (currItem.target == null) ? null : currItem.target;
			this.content = (currItem.content == null) ? null : currItem.content;
			this.path = (currItem.path == "") ? null : currItem.path;
			this.title = (currItem.title == "") ? null : currItem.title;
			this.fileType = (currItem.fileType == null) ? null : currItem.fileType;
			this.bytesLoaded = (currItem.bytesLoaded == null) ? null : currItem.bytesLoaded;
			this.bytesTotal = (currItem.bytesTotal == null) ? null : currItem.bytesTotal;
			this.percentage = (currItem.progress == null) ? null : currItem.progress;
			this.queuepercentage = queuepercentage;
			this.index = index;
			this.length = length;
			this.bandwidth = bandwidth;
			this.queueBytes = queueBytes;
			this.width = (currItem.width == null) ? null : currItem.width;
			this.height = (currItem.height == null) ? null : currItem.height;
			this.message = (currItem.message == null) ? null : currItem.message;
			this.bmArray = (currItem.bmArray == null) ? null : currItem.bmArray;
			this.info = (currItem.info == null) ? null : currItem.info;
		}
	}
}