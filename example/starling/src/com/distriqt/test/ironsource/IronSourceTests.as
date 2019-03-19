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
package com.distriqt.test.ironsource
{
	import com.distriqt.extension.ironsource.IronSource;
	import com.distriqt.extension.ironsource.IronSource;
	
	import flash.display.Bitmap;
	import flash.events.DataEvent;
	import flash.filesystem.File;
	import flash.geom.Rectangle;
	import flash.net.URLRequest;
	import flash.net.navigateToURL;
	import flash.utils.setTimeout;
	
	import starling.core.Starling;
	
	import starling.display.Image;
	import starling.display.Sprite;
	
	/**	
	 */
	public class IronSourceTests extends Sprite
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
		
		public function IronSourceTests( logger:ILogger )
		{
			_l = logger;
			try
			{
				log( "IronSource Supported: " + IronSource.isSupported );
				if (IronSource.isSupported)
				{
					log( "IronSource Version:   " + IronSource.instance.version );
					log( "IronSource Native Version:   " + IronSource.instance.nativeVersion );
					
					
					IronSource.instance.init( Config.IRONSRC_APP_KEY,
											  [
												  IronSource.REWARDED_VIDEO,
												  IronSource.INTERSTITIAL
											  ]
					);
					
					IronSource.instance.setDynamicUserId( "test_identifier_1" );
					
					IronSource.instance.addEventListener( "onRewardedVideoAdOpened", onRewardedVideoAdOpened );
					IronSource.instance.addEventListener( "onRewardedVideoAdClosed", onRewardedVideoAdClosed );
					IronSource.instance.addEventListener( "onRewardedVideoAvailabilityChanged", onRewardedVideoAvailabilityChanged );
					IronSource.instance.addEventListener( "onRewardedVideoAdStarted", onRewardedVideoAdStarted );
					IronSource.instance.addEventListener( "onRewardedVideoAdEnded", onRewardedVideoAdEnded );
					IronSource.instance.addEventListener( "onRewardedVideoAdRewarded", onRewardedVideoAdRewarded );
					IronSource.instance.addEventListener( "onRewardedVideoAdShowFailed", onRewardedVideoAdShowFailed );
					IronSource.instance.addEventListener( "onRewardedVideoAdClicked", onRewardedVideoAdClicked );
					
					IronSource.instance.addEventListener( "onInterstitialAdReady", onInterstitialAdReady );
					IronSource.instance.addEventListener( "onInterstitialAdLoadFailed", onInterstitialAdLoadFailed );
					IronSource.instance.addEventListener( "onInterstitialAdOpened", onInterstitialAdOpened );
					IronSource.instance.addEventListener( "onInterstitialAdClosed", onInterstitialAdClosed );
					IronSource.instance.addEventListener( "onInterstitialAdShowSucceeded", onInterstitialAdShowSucceeded );
					IronSource.instance.addEventListener( "onInterstitialAdShowFailed", onInterstitialAdShowFailed );
					IronSource.instance.addEventListener( "onInterstitialAdClicked", onInterstitialAdClicked );
					
					IronSource.instance.validateIntegration();
					
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
		
		public function showRewardedVideo():void
		{
			log( "showRewardedVideo" );
			if (IronSource.instance.isRewardedVideoAvailable())
			{
				IronSource.instance.showRewardedVideo();
			}
			else
			{
				log( "Rewarded Video not available" );
			}
		}
		
		
		
		
		public function loadInterstitial():void
		{
			log( "loadInterstitial" );
			if (!IronSource.instance.isInterstitialReady())
			{
				IronSource.instance.loadInterstitial();
			}
		}
		
		
		public function showInterstitial():void
		{
			log( "showInterstitial" );
			if (IronSource.instance.isInterstitialReady())
			{
				IronSource.instance.showInterstitial();
			}
		}
		
		
		
		
		
		
		
		
		
		
		////////////////////////////////////////////////////////
		//
		//
		
		private function onRewardedVideoAdShowFailed( event:DataEvent ):void
		{
			log( "onRewardedVideoAdShowFailed" );
		}
		
		
		private function onRewardedVideoAdOpened( event:DataEvent ):void
		{
			log( "onRewardedVideoAdOpened" );
		}
		
		
		private function onRewardedVideoAdClosed( event:DataEvent ):void
		{
			log( "onRewardedVideoAdClosed" );
		}
		
		
		private function onRewardedVideoAvailabilityChanged( event:DataEvent ):void
		{
			log( "onRewardedVideoAvailabilityChanged" );
		}
		
		
		private function onRewardedVideoAdStarted( event:DataEvent ):void
		{
			log( "onRewardedVideoAdStarted" );
		}
		
		
		private function onRewardedVideoAdEnded( event:DataEvent ):void
		{
			log( "onRewardedVideoAdEnded" );
		}
		
		
		private function onRewardedVideoAdRewarded( event:DataEvent ):void
		{
			log( "onRewardedVideoAdRewarded" );
			
		}
		
		
		private function onRewardedVideoAdClicked( event:DataEvent ):void
		{
			log( "onRewardedVideoAdClicked" );
		}
		
		
		private function onInterstitialAdReady( event:DataEvent ):void
		{
			log( "onInterstitialAdReady" );
		}
		
		
		private function onInterstitialAdLoadFailed( event:DataEvent ):void
		{
			log( "onInterstitialAdLoadFailed" );
		}
		
		
		private function onInterstitialAdOpened( event:DataEvent ):void
		{
			log( "onInterstitialAdOpened" );
		}
		
		
		private function onInterstitialAdClosed( event:DataEvent ):void
		{
			log( "onInterstitialAdClosed" );
		}
		
		
		private function onInterstitialAdShowFailed( event:DataEvent ):void
		{
			log( "onInterstitialAdShowFailed" );
		}
		
		
		private function onInterstitialAdClicked( event:DataEvent ):void
		{
			log( "onInterstitialAdClicked" );
		}
		
		
		private function onInterstitialAdShowSucceeded( event:DataEvent ):void
		{
			log( "onInterstitialAdShowSucceeded" );
		}
		
		
	}
	
}
