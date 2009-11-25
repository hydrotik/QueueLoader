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
	import flash.utils.Dictionary;	

	/**
	 * @author Donovan Adams | Hydrotik | http://blog.hydrotik.com
	 * @version: 3.1.8
	 */
	public class QLManager {

		private static var _queues : Dictionary = new Dictionary(true);

		public static function addQueue(id : String, queue : IQueueLoader) : Boolean {
			for (var i:String in _queues) if (i == id) return false;
			_queues[id] = queue;
			return true;
		}

		public static function removeQueue(id : String) : Boolean {
			for (var i:String in _queues) {
				if (i == id) {
					_queues[i] = null;
					delete _queues[i];
					i == null;
					return true;
				}
			}
			return false;
		}

		public static function getQueue(id : String) : IQueueLoader {
			for (var i:String in _queues) if (i == id) return _queues[i];
			return null;
		}

		
		public static function traceClassList() : void {
			for (var i:String in _queues) {
				trace(i + " - " + _queues[i]);
			}
		}

		public static function length() : int {
			var len : int = 0;
			for (var i:String in _queues) len++;
			return len;
			trace(i);
		}

		public static function disposeAll() : void {
			for (var i:String in _queues) _queues[i].dispose();
		}
	}
}
