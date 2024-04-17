/**
 *        __       __               __
 *   ____/ /_ ____/ /______ _ ___  / /_
 *  / __  / / ___/ __/ ___/ / __ `/ __/
 * / /_/ / (__  ) / / /  / / /_/ / /
 * \__,_/_/____/_/ /_/  /_/\__, /_/
 *                           / /
 *                           \/
 * http://distriqt.com
 *
 * @author 		Michael Archbold (https://github.com/marchbold)
 * @created		08/01/2016
 * @copyright	http://distriqt.com/copyright/license.txt
 */
package com.distriqt.test.digitalturbine
{
	import com.distriqt.extension.ironsource.IronSource;
	import com.distriqt.extension.ironsource.digitalturbine.DigitalTurbine;

	import starling.display.Sprite;

	/**
	 */
	public class DigitalTurbineTests extends Sprite
	{
		public static const TAG:String = "";

		private var _l:ILogger;

		private function log( log:String ):void
		{
			_l.log( TAG, log );
		}


		////////////////////////////////////////////////////////
		//	FUNCTIONALITY
		//

		public function DigitalTurbineTests( logger:ILogger )
		{
			_l = logger;
			try
			{
				log( "DigitalTurbine Supported: " + DigitalTurbine.isSupported );
				if (DigitalTurbine.isSupported)
				{
					log( "DigitalTurbine Version:   " + DigitalTurbine.service.version );
				}

			}
			catch (e:Error)
			{
				trace( e );
			}
		}


		////////////////////////////////////////////////////////
		//  
		//

		public function test():void
		{
			IronSource.instance.validateIntegration();
		}


	}
}
