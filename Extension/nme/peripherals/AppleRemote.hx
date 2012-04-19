package nme.peripherals;

import cpp.Lib;

/**
 * Native extension glue code
 * @author Philippe Elsass
 */
class AppleRemote
{
	/**
	 * Set Apple Remote events listener
	 * - providing a function starts monitoring
	 * - seting to 'null' stops monitoring
	 */
	public static function setEventHandler(handler:Dynamic->Void):Void 
	{	
		remote_set_handler(handler);
	}
	
	private static var remote_set_handler = Lib.load("appleRemote", "remote_set_handler", 1);
}