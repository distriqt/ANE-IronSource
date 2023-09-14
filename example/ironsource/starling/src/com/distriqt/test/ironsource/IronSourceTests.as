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
	import com.distriqt.extension.ironsource.IronSourceBannerSize;
	import com.distriqt.extension.ironsource.events.BannerAdEvent;
	import com.distriqt.extension.ironsource.events.InterstitialAdEvent;
	import com.distriqt.extension.ironsource.events.OfferwallEvent;
	import com.distriqt.extension.ironsource.events.RewardedVideoAdEvent;

	import starling.display.Sprite;

	/**
	 *
	 */
	public class IronSourceTests extends Sprite
	{
		public static const TAG:String = "";

		private var _l:ILogger;

		private function log( log:String ):void
		{
			_l.log( TAG, log );
		}

		public function IronSourceTests( logger:ILogger )
		{
			_l = logger;
			try
			{


				log( "IronSource Supported: " + IronSource.isSupported );
				if (IronSource.isSupported)
				{
					IronSource.instance.setIronSourceClientSideCallbacks( true );

					IronSource.instance.setDynamicUserId( "test_dynamic_identifier_1" );

//					IronSource.instance.addEventListener( "onRewardedVideoAdOpened", onRewardedVideoAdOpened );
//					IronSource.instance.addEventListener( "onRewardedVideoAdClosed", onRewardedVideoAdClosed );
//					IronSource.instance.addEventListener( "onRewardedVideoAvailabilityChanged", onRewardedVideoAvailabilityChanged );
//					IronSource.instance.addEventListener( "onRewardedVideoAdStarted", onRewardedVideoAdStarted );
//					IronSource.instance.addEventListener( "onRewardedVideoAdEnded", onRewardedVideoAdEnded );
//					IronSource.instance.addEventListener( "onRewardedVideoAdRewarded", onRewardedVideoAdRewarded );
//					IronSource.instance.addEventListener( "onRewardedVideoAdShowFailed", onRewardedVideoAdShowFailed );
//					IronSource.instance.addEventListener( "onRewardedVideoAdClicked", onRewardedVideoAdClicked );

					IronSource.instance.addEventListener( RewardedVideoAdEvent.OPENED, onRewardedVideoAdOpened );
					IronSource.instance.addEventListener( RewardedVideoAdEvent.CLOSED, onRewardedVideoAdClosed );
					IronSource.instance.addEventListener( RewardedVideoAdEvent.AVAILABILITY_CHANGED,
														  onRewardedVideoAvailabilityChanged );
					IronSource.instance.addEventListener( RewardedVideoAdEvent.REWARDED, onRewardedVideoAdRewarded );
					IronSource.instance.addEventListener( RewardedVideoAdEvent.SHOW_FAILED,
														  onRewardedVideoAdShowFailed );
					IronSource.instance.addEventListener( RewardedVideoAdEvent.CLICKED, onRewardedVideoAdClicked );

					IronSource.instance.addEventListener( "onInterstitialAdReady", onInterstitialAdReady );
					IronSource.instance.addEventListener( "onInterstitialAdLoadFailed", onInterstitialAdLoadFailed );
					IronSource.instance.addEventListener( "onInterstitialAdOpened", onInterstitialAdOpened );
					IronSource.instance.addEventListener( "onInterstitialAdClosed", onInterstitialAdClosed );
					IronSource.instance.addEventListener( "onInterstitialAdShowSucceeded",
														  onInterstitialAdShowSucceeded );
					IronSource.instance.addEventListener( "onInterstitialAdShowFailed", onInterstitialAdShowFailed );
					IronSource.instance.addEventListener( "onInterstitialAdClicked", onInterstitialAdClicked );


					IronSource.instance.addEventListener( BannerAdEvent.LOADED, bannerHandler );
					IronSource.instance.addEventListener( BannerAdEvent.LOAD_FAILED, bannerLoadFailedHandler );
					IronSource.instance.addEventListener( BannerAdEvent.CLICKED, bannerHandler );
					IronSource.instance.addEventListener( BannerAdEvent.SCREEN_PRESENTED, bannerHandler );
					IronSource.instance.addEventListener( BannerAdEvent.SCREEN_DISMISSED, bannerHandler );
					IronSource.instance.addEventListener( BannerAdEvent.LEFT_APPLICATION, bannerHandler );

					IronSource.instance.addEventListener( OfferwallEvent.AVAILABLE, offerwallHandler );
					IronSource.instance.addEventListener( OfferwallEvent.SHOW_FAILED, offerwallErrorHandler );
					IronSource.instance.addEventListener( OfferwallEvent.OPENED, offerwallHandler );
					IronSource.instance.addEventListener( OfferwallEvent.CLOSED, offerwallHandler );
					IronSource.instance.addEventListener( OfferwallEvent.AD_CREDITED, adCreditedHandler );
					IronSource.instance.addEventListener( OfferwallEvent.GETOFFERWALLCREDITS_FAILED,
														  offerwallErrorHandler );


					IronSource.instance.init( Config.IRONSRC_APP_KEY, [
						IronSource.BANNER,
						IronSource.REWARDED_VIDEO,
						IronSource.INTERSTITIAL,
						IronSource.OFFERWALL
					] );

					IronSource.instance.validateIntegration();

					log( "IronSource Version:        " + IronSource.instance.version );
					log( "IronSource Native Version: " + IronSource.instance.nativeVersion );

				}

			}
			catch (e:Error)
			{
				trace( e );
			}
		}


		////////////////////////////////////////////////////////
		//	FUNCTIONALITY
		//

		public function getAdvertisingId():void
		{
			log( "IronSource Advertising Id: " + IronSource.instance.getAdvertiserId() );
		}


		////////////////////////////////////////////////////////
		//
		//

		public function loadBanner():void
		{
			log( "loadBanner()" );
			IronSource.instance.loadBanner(
					IronSourceBannerSize.LARGE,
					IronSource.POSITION_BOTTOM
			);
		}


		public function displayBanner():void
		{
			log( "displayBanner()" );
			IronSource.instance.displayBanner();
		}

		public function hideBanner():void
		{
			log( "hideBanner()" );
			IronSource.instance.hideBanner();
		}

		public function destroyBanner():void
		{
			log( "destroyBanner()" );
			IronSource.instance.destroyBanner();
		}

		private function bannerHandler( event:BannerAdEvent ):void
		{
			log( "BANNER: " + event.type );
		}

		private function bannerLoadFailedHandler( event:BannerAdEvent ):void
		{
			var errorCode:String;
			var errorDescription:String;
			if (event.data)
			{
				var error:Object = JSON.parse( event.data );
				errorDescription = error.error_description;
				errorCode = error.error_code;
				log( "ERROR: [" + errorCode + "]: " + errorDescription )
			}
		}


		//
		// REWARDED VIDEO
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

		private function onRewardedVideoAdShowFailed( event:RewardedVideoAdEvent ):void
		{
			log( "onRewardedVideoAdShowFailed" );
			if (event.adInfo != null) log( "adInfo:" + event.adInfo.toString() );
			if (event.error != null) log( "error:[" + event.error.errorID + "] " + event.error.message );
		}

		private function onRewardedVideoAdOpened( event:RewardedVideoAdEvent ):void
		{
			log( "onRewardedVideoAdOpened" );
			if (event.adInfo != null) log( "adInfo:" + event.adInfo.toString() );
		}

		private function onRewardedVideoAdClosed( event:RewardedVideoAdEvent ):void
		{
			log( "onRewardedVideoAdClosed" );
			if (event.adInfo != null) log( "adInfo:" + event.adInfo.toString() );
		}

		private function onRewardedVideoAvailabilityChanged( event:RewardedVideoAdEvent ):void
		{
			log( "onRewardedVideoAvailabilityChanged: " + event.availability );
			if (event.adInfo != null) log( "adInfo:" + event.adInfo.toString() );
		}

		private function onRewardedVideoAdRewarded( event:RewardedVideoAdEvent ):void
		{
			log( "onRewardedVideoAdRewarded" );
			if (event.adInfo != null) log( "adInfo:" + event.adInfo.toString() );
			log( "placementName: " + event.placementInfo.placementName );
			log( "rewardName:    " + event.placementInfo.rewardName );
			log( "rewardAmount:  " + event.placementInfo.rewardAmount );
		}

		private function onRewardedVideoAdClicked( event:RewardedVideoAdEvent ):void
		{
			log( "onRewardedVideoAdClicked" );
			if (event.adInfo != null) log( "adInfo:" + event.adInfo.toString() );
		}


		//
		//	INTERSTITIALS
		//


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

		private function onInterstitialAdReady( event:InterstitialAdEvent ):void
		{
			log( "onInterstitialAdReady" );
			if (event.adInfo != null) log( "adInfo:" + event.adInfo.toString() );
		}

		private function onInterstitialAdLoadFailed( event:InterstitialAdEvent ):void
		{
			log( "onInterstitialAdLoadFailed" );
			if (event.adInfo != null) log( "adInfo:" + event.adInfo.toString() );
			if (event.error != null) log( "error:[" + event.error.errorID + "] " + event.error.message );
		}

		private function onInterstitialAdOpened( event:InterstitialAdEvent ):void
		{
			log( "onInterstitialAdOpened" );
			if (event.adInfo != null) log( "adInfo:" + event.adInfo.toString() );
		}

		private function onInterstitialAdClosed( event:InterstitialAdEvent ):void
		{
			log( "onInterstitialAdClosed" );
			if (event.adInfo != null) log( "adInfo:" + event.adInfo.toString() );
		}

		private function onInterstitialAdShowFailed( event:InterstitialAdEvent ):void
		{
			log( "onInterstitialAdShowFailed" );
			if (event.adInfo != null) log( "adInfo:" + event.adInfo.toString() );
			if (event.error != null) log( "error:[" + event.error.errorID + "] " + event.error.message );
		}

		private function onInterstitialAdClicked( event:InterstitialAdEvent ):void
		{
			log( "onInterstitialAdClicked" );
			if (event.adInfo != null) log( "adInfo:" + event.adInfo.toString() );
		}

		private function onInterstitialAdShowSucceeded( event:InterstitialAdEvent ):void
		{
			log( "onInterstitialAdShowSucceeded" );
			if (event.adInfo != null) log( "adInfo:" + event.adInfo.toString() );
		}


		//
		//	OFFERWALL
		//


		public function showOfferwall():void
		{
			if (IronSource.instance.isOfferwallAvailable())
			{
				IronSource.instance.showOfferwall();
			}
		}

		public function getOfferwallCredits():void
		{
			IronSource.instance.getOfferwallCredits();
		}


		private function offerwallHandler( event:OfferwallEvent ):void
		{
			log( "OFFERWALL: " + event.type + " available: " + IronSource.instance.isOfferwallAvailable() );
		}

		private function adCreditedHandler( event:OfferwallEvent ):void
		{
			log( "OFFERWALL: " + event.type );
			log( "  credits=" + event.credits );
			log( "  totalCredits=" + event.totalCredits );
			log( "  totalCreditsFlag=" + event.totalCreditsFlag );
		}

		private function offerwallErrorHandler( event:OfferwallEvent ):void
		{
			var data:Object = JSON.parse( event.data );
			log( "ERROR : [" + data.error_code + "] " + data.error_description );
		}

	}

}
