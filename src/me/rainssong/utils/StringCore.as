﻿package me.rainssong.utils
{

	
	/**
	 * ...
	 * @author Rainssong
	 */
	public class StringCore
	{
		/**
		 * 换行符
		 */
		public static const NEW_LINE:String = "\r\n";
		
		public static const NEW_LINE_R:String = "\r";
		
		public static const NEW_LINE_N:String = "\n";
		
		/**
		 * Tab
		 */
		public static const TAB:String = "\t";
		
		/**
		 * 行分割符
		 */
		public static const LINE_SEPARATOR:String = " -------------------------------------------------------------------------------------------------- /";
		
		/**
		 * 一个字节所能表示的最大的无符号整数
		 */
		public static const BYTE_MAX:uint = 255;
		
		/**
		 * 两个字节所能表示的最大无符号整数
		 */
		public static const SHORT_MAX:uint = 65535;
		
		/**
		 * 所能使用的最大端口号
		 */
		public static const PORT_MAX:uint = SHORT_MAX;
		
		/**
		 * int类型占用的字节数
		 */
		public static const INT_BYTE_SIZE:uint = 4;
		
		/**
		 * uint类型占用的字节数
		 */
		public static const UINT_BYTE_SIZE:uint = 4;
		
		/**
		 * float类型占用的字节数
		 */
		public static const FLOAT_BYTE_SIZE:uint = 4;
		
		/**
		 * double类型占用的字节数
		 */
		public static const DOUBLE_BYTE_SIZE:uint = 8;
		
		public function StringCore()
		{
			
		}
		
		/**
		 *
		 * @param	str String to sort
		 * @param	args Sort params
		 * @return String after sort
		 * @copy Array
		 */
		public static function sort(str:String, ... args):String
		{
			var resortArr:Array = str.split("");
			superTrace("old resortArr:" + resortArr);
			resortArr.sort.apply(null, args);
			superTrace("new resortArr:" + resortArr);
			return String(resortArr);
		}
		
		/**
		 * null or ""
		 * @param	str
		 * @return
		 */
		public static function isEmpty(str:String) : Boolean
        {
            if (str == null)
            {
                return true;
            }
            return !str.length;
        }
		
		public static function deleteProtocol(url:String):String
		{
			return url.replace(/[a-zA-z]+:\/\//, "");
		}
		
		public static function getFileName( url:String ):String {
			// Find the location of the period.
			var fullName:String=url.substr( url.lastIndexOf( '/' )+1 );
			var extensionIndex:Number = fullName.lastIndexOf( '.' );
			if ( extensionIndex == -1 ) {
				// Oops, there is no period. Just return the filename.
				return fullName;
			} else {
				return fullName.substr( 0, extensionIndex );
			} 
		}
		
		public static function getExtension(url:String):String
		{
			var result:String = url.split(".").pop();
			result = result.split("?")[0];
			return result;
		}
		
		//static public function webToLocal(url:String):String
		//{
			//return FileCore.File ? FileCore.File.applicationStorageDirectory.resolvePath(StringCore.deleteProtocol(url)).nativePath : null;
		//}
		
		public static function wordCount(str:String):uint
		{
			if (str == null)
			{
				return 0;
			}
			return str.match(/\b\w+\b/g).length;
		} // end function
		
		public static function trimLeft(str:String):String
		{
			if (str == null)
			{
				return "";
			}
			return str.replace(/^\s+/, "");
		} // end function
		
		public static function trimRight(str:String):String
		{
			if (str == null)
			{
				return "";
			}
			return str.replace(/\s+$/, "");
		} // end function
		
		public static function trim(str:String):String
		{
			if (str == null)
			{
				return "";
			}
			return str.replace(/^\s+|\s+$/g, "");
		} // end function
		
		/**
		 * 
		 * @param	str
		 * @return the content between tags
		 */
		public static function stripTags(str:String):String
		{
			if (str == null)
			{
				return "";
			}
			return str.replace(/<\/?[^>]+>/igm, "");
		} // end function
		
		public static function isNumeric(str:String) : Boolean
        {
            if (str == null)
            {
                return false;
            }
            var exp:RegExp = /^[-+]?\d*\.?\d+(?:[eE][-+]?\d+)?$/;
            return exp.test(str);
        }// end function
		
		 public static function reverseWords(str:String) : String
        {
            if (str == null)
            {
                return "";
            }
            return str.split(/\s+/).reverse().join("");
        }// end function
		
		 public static function reverse(str:String) : String
        {
            if (str == null)
            {
                return "";
            }
            return str.split("").reverse().join("");
        }// end function
		
		static public function webToLocal(url:String):String 
		{
			return url.split("://").pop().replace(":","//");
		}

		
		//public static function getFileName(url:String):String
		//{
		//return url.split(/[\\/] / ).slice( -1)[0];
		//}
	}
}