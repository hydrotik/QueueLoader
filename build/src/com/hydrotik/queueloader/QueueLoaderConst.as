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

	/**
	 * @author Donovan/Eric | 3.2.0
	 */
	public final class QueueLoaderConst {

		/***************************************
		 ******	 LOADABLE ITEM LIST   **********
		 ***************************************/

		public static const FILE_IMAGE : int = 1;

		public static const FILE_SWF : int = 2;

		public static const FILE_XML : int = 3;

		public static const FILE_CSS : int = 4;

		public static const FILE_MP3 : int = 5;

		public static const FILE_ZIP : int = 6;

		public static const FILE_WAV : int = 7;

		public static const FILE_FLV : int = 8;

		public static const FILE_GENERIC : int = 9;

		public static const VERSION : String = "QueueLoader 3.2.0";

		public static const AUTHOR : String = "Donovan Adams - donovan[(replace at)]hydrotik.com";

		public static var VERBOSE : Boolean = false;

		public static var VERBOSE_BANDWITH : Boolean = false;
	}
}
