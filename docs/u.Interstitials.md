


## Load Interstitial


```as3
IronSource.instance.loadInterstitial();
```

This will dispatch one of two events when complete:

- `InterstitialAdEvent.READY`: If the interstitial was loaded and is now ready to display;
- `InterstitialAdEvent.FAILED`: if there was an error loading the advert;


```as3
IronSource.instance.addEventListener( InterstitialAdEvent.READY, onInterstitialAdReady );
IronSource.instance.addEventListener( InterstitialAdEvent.FAILED, onInterstitialAdLoadFailed );

IronSource.instance.loadInterstitial();


function onInterstitialAdReady( event:DataEvent ):void
{
    trace( "onInterstitialAdReady" );
}

function onInterstitialAdLoadFailed( event:DataEvent ):void
{
    trace( "onInterstitialAdLoadFailed" );
}
```



## Check State Of Interstitial

You can use the `isInterstitialReady()` flag to determine if an interstitial is loaded and ready to display.

```as3
if (IronSource.instance.isInterstitialReady())
{
    // Interstitial is loaded and ready to display
}
```




## Show Interstitial

When you are ready to show your interstitial simply call `showInterstitial()`:

```as3
IronSource.instance.showInterstitial();
```

Displaying an interstitial will dispatch several events:

- `InterstitialAdEvent.OPENED`: The interstitial was opened and is visible to the user;
- `InterstitialAdEvent.CLOSED`: The ad was closed by the user;
- `InterstitialAdEvent.SHOW_SUCCEEDED`: The interstitial was shown and is visible to the user;
- `InterstitialAdEvent.SHOW_FAILED`: There was an error showing the interstitial;
- `InterstitialAdEvent.CLICKED`: If the user clicked on the advert;


For example:

```as3
IronSource.instance.addEventListener( InterstitialAdEvent.OPENED, onInterstitialAdOpened );
IronSource.instance.addEventListener( InterstitialAdEvent.CLOSED, onInterstitialAdClosed );
IronSource.instance.addEventListener( InterstitialAdEvent.SHOW_SUCCEEDED, onInterstitialAdShowSucceeded );
IronSource.instance.addEventListener( InterstitialAdEvent.SHOW_FAILED, onInterstitialAdShowFailed );
IronSource.instance.addEventListener( InterstitialAdEvent.CLICKED, onInterstitialAdClicked );


if (IronSource.instance.isInterstitialReady())
{
    IronSource.instance.showInterstitial();
}

function onInterstitialAdOpened( event:DataEvent ):void
{
    trace( "onInterstitialAdOpened" );
}

function onInterstitialAdClosed( event:DataEvent ):void
{
    trace( "onInterstitialAdClosed" );
}

function onInterstitialAdShowFailed( event:DataEvent ):void
{
    trace( "onInterstitialAdShowFailed" );
}

function onInterstitialAdClicked( event:DataEvent ):void
{
    trace( "onInterstitialAdClicked" );
}

function onInterstitialAdShowSucceeded( event:DataEvent ):void
{
    trace( "onInterstitialAdShowSucceeded" );
}				
```
