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
 * @author 		"Michael Archbold (ma&#64;distriqt.com)"
 * @created		08/01/2016
 * @copyright	http://distriqt.com/copyright/license.txt
 */
package com.distriqt.test.isallmediators
{
	import com.distriqt.extension.ironsource.IronSource;
	import com.distriqt.extension.ironsource.isallmediators.ISAllMediators;

	import starling.display.Sprite;

	/**
	 */
	public class ISAllMediatorsTests extends Sprite
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

		public function ISAllMediatorsTests( logger:ILogger )
		{
			_l = logger;
			try
			{
//				log( "ISAllMediators Supported: " + ISAllMediators.isSupported );
//				if (ISAllMediators.isSupported)
//				{
//					log( "ISAllMediators Version:   " + ISAllMediators.service.version );
//				}

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
