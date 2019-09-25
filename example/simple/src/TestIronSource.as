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
 * This is a test application for the distriqt extension
 * 
 * @author Michael Archbold & Shane Korin
 * 	
 */
package
{
	import com.distriqt.extension.ironsource.IronSource;
	import com.distriqt.extension.ironsource.events.RewardedVideoAdEvent;
	
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	
	/**	
	 * Sample application for using the IronSource Native Extension
	 */
	public class TestIronSource extends Sprite
	{
		public static var IRONSRC_APP_KEY : String = "XXXXXXXX";
		
		
		/**
		 * Class constructor 
		 */	
		public function TestIronSource()
		{
			super();
			init();
		}
		
		
		//
		//	VARIABLES
		//
		
		
		private var _text		: TextField;
		
		
		//
		//	INITIALISATION
		//	
		
		private function init( ):void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			_text = new TextField();
			_text.mouseEnabled = false;
			_text.defaultTextFormat = new TextFormat( "_typewriter", 18 );
			addChild( _text );

			stage.addEventListener( Event.RESIZE, stage_resizeHandler, false, 0, true );
			stage.addEventListener( MouseEvent.CLICK, mouseClickHandler, false, 0, true );
			
			try
			{
				message( "IronSource Supported:      " + IronSource.isSupported );
				if (IronSource.isSupported)
				{
					message( "IronSource Version:        " + IronSource.service.version );
					message( "IronSource Native Version: " + IronSource.instance.nativeVersion );
					
					IronSource.instance.init( IRONSRC_APP_KEY, [ IronSource.REWARDED_VIDEO ] );
					
					IronSource.instance.addEventListener( RewardedVideoAdEvent.OPENED, onRewardedVideoAdOpened );
					IronSource.instance.addEventListener( RewardedVideoAdEvent.CLOSED, onRewardedVideoAdClosed );
					IronSource.instance.addEventListener( RewardedVideoAdEvent.AVAILABILITY_CHANGED, onRewardedVideoAvailabilityChanged );
					IronSource.instance.addEventListener( RewardedVideoAdEvent.STARTED, onRewardedVideoAdStarted );
					IronSource.instance.addEventListener( RewardedVideoAdEvent.ENDED, onRewardedVideoAdEnded );
					IronSource.instance.addEventListener( RewardedVideoAdEvent.REWARDED, onRewardedVideoAdRewarded );
					IronSource.instance.addEventListener( RewardedVideoAdEvent.SHOW_FAILED, onRewardedVideoAdShowFailed );
					IronSource.instance.addEventListener( RewardedVideoAdEvent.CLICKED, onRewardedVideoAdClicked );
					
					
				}
			}
			catch (e:Error)
			{
				message( "ERROR::"+e.message );
			}
		}
		
		
		//
		//	FUNCTIONALITY
		//
		
		private function message( str:String ):void
		{
			trace( str );
			_text.appendText(str+"\n");
		}
		
		
		//
		//	EVENT HANDLERS
		//
		
		private function stage_resizeHandler( event:Event ):void
		{
			_text.width  = stage.stageWidth;
			_text.height = stage.stageHeight - 100;
		}
		
		
		private function mouseClickHandler( event:MouseEvent ):void
		{
			if (IronSource.instance.isRewardedVideoAvailable())
			{
				IronSource.instance.showRewardedVideo();
			}
			else
			{
				message( "Rewarded Video not available" );
			}
			
		}
		
		
		//
		//	EXTENSION HANDLERS
		//
		
		
		
		private function onRewardedVideoAdShowFailed( event:RewardedVideoAdEvent ):void
		{
			message( "onRewardedVideoAdShowFailed" );
		}


		private function onRewardedVideoAdOpened( event:RewardedVideoAdEvent ):void
		{
			message( "onRewardedVideoAdOpened" );
		}


		private function onRewardedVideoAdClosed( event:RewardedVideoAdEvent ):void
		{
			message( "onRewardedVideoAdClosed" );
		}


		private function onRewardedVideoAvailabilityChanged( event:RewardedVideoAdEvent ):void
		{
			message( "onRewardedVideoAvailabilityChanged: " + event.availability );
		}


		private function onRewardedVideoAdStarted( event:RewardedVideoAdEvent ):void
		{
			message( "onRewardedVideoAdStarted" );
		}


		private function onRewardedVideoAdEnded( event:RewardedVideoAdEvent ):void
		{
			message( "onRewardedVideoAdEnded" );
		}


		private function onRewardedVideoAdRewarded( event:RewardedVideoAdEvent ):void
		{
			message( "onRewardedVideoAdRewarded" );

		}


		private function onRewardedVideoAdClicked( event:RewardedVideoAdEvent ):void
		{
			message( "onRewardedVideoAdClicked" );
		}
		
		
	}
}

