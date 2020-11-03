
A banner ad is a rectangular ad that is typically displayed on the top or bottom of the screen and remains in place for the entire user session. Banner ads can be static or dynamic.

![](images/banner.png)

## Load a Banner Ad

To load a banner ad, call the `loadBanner()` function with the required banner size and position:

```as3
IronSource.instance.loadBanner( 
    IronSourceBannerSize.BANNER,
    IronSource.POSITION_BOTTOM
);
```

### Banner Dimensions and Position

When loading the banner, make sure to configure your Banner Size:

- `IronSourceBannerSize.BANNER`: Standard Banner, Best for Phones & Tablets;
- `IronSourceBannerSize.LARGE`: Large Banner, Best for Tablets and Larger Devices;
- `IronSourceBannerSize.RECTANGLE`: Large Rectangular Banner, Best for Scrollable Feeds or Between Game Levels;
- `IronSourceBannerSize.SMART`: Smart Banner, Renders ads that automatically resize to fit the device’s size and orientation;

and position:

- `IronSource.POSITION_TOP`: Banner will be positioned at the top center of the screen;
- `IronSource.POSITION_BOTTOM`: Banner will be positioned at the bottom center of the screen;


### Banner Placements

We support placements, as well as capping and pacing for Banners on the ironSource dashboard. Learn how to set up placements, capping and pacing for Banners to optimize your app’s user experience here.

If you’ve set up placements for your Banner, call the following method to serve a Banner ad in a specific location:

```as3
IronSource.instance.loadBanner( 
    IronSourceBannerSize.BANNER,
    IronSource.POSITION_BOTTOM,
    "placement_name"
);
```

### Load Events

After you call load you will receive one of two events:

- `BannerAdEvent.LOADED`: Dispatched once the banner has loaded;
- `BannerAdEvent.LOAD_FAILED`: Dispatched if there was an error loading the banner ad;


For example: 

```as3
IronSource.instance.addEventListener( BannerAdEvent.LOADED, onBannerAdLoaded );
IronSource.instance.addEventListener( BannerAdEvent.LOAD_FAILED, onBannerAdLoadFailed );


IronSource.instance.loadBanner( IronSourceBannerSize.BANNER, IronSource.POSITION_BOTTOM );


function onBannerAdLoaded(event:BannerAdEvent):void 
{
    // Banner is loaded and can now be displayed
    IronSource.instance.displayBanner();
}

function onBannerAdLoadFailed(event:BannerAdEvent):void 
{
    var errorCode:String;
    var errorDescription:String;
    if (event.data) 
    {
        var error:Object = JSON.parse(event.data);
        errorDescription = error.error_description;
        errorCode = error.error_code;
    }
}
```



## Hide and Display Banner

In order to provide maximum flexibility in the ad experience, you now have the ability to hide and present banners on your app.

Once you’ve loaded and served a banner, you can choose to hide this banner and re-show it at a later point in your app.

To hide the banner, call this function:

```as3
IronSource.instance.hideBanner();
```

To then show this same banner again, call this function:

```as3
IronSource.instance.displayBanner();
```


## Destroy

Once you’ve successfully served a banner, we recommend calling the below function to destroy the banner.

```as3
IronSource.instance.destroyBanner();
```

After you call this method, the banner in question can no longer be used. In the case you want to serve another banner, you will need to request a new Banner using the `loadBanner()` method.



## Events

The ironSource Air Plugin fires several events to inform you of ad availability and activity. To listen to any event, call the `addEventListener` method.

The event names are defined in the `BannerAdEvent` class.

- `BannerAdEvent.CLICKED`: Dispatched when the user clicks the banner;
- `BannerAdEvent.SCREEN_PRESENTED`: Notifies the presentation of a full screen content following user click;
- `BannerAdEvent.SCREEN_DISMISSED`: Notifies the presented screen has been dismissed;
- `BannerAdEvent.LEFT_APPLICATION`: Invoked when the user leaves the app;


You add listeners for these as follows:


```as3
IronSource.instance.addEventListener( BannerAdEvent.CLICKED, onBannerAdClicked );
IronSource.instance.addEventListener( BannerAdEvent.SCREEN_PRESENTED, onBannerAdScreenPresented );
IronSource.instance.addEventListener( BannerAdEvent.SCREEN_DISMISSED, onBannerAdScreenDismissed );
IronSource.instance.addEventListener( BannerAdEvent.LEFT_APPLICATION, onBannerAdLeftApplication );

private function onBannerAdClicked(event:DataEvent):void 
{

}

private function onBannerAdScreenPresented(event:DataEvent):void 
{

}

private function onBannerAdScreenDismissed(event:DataEvent):void 
{

}

private function onBannerAdLeftApplication(event:DataEvent):void 
{

}
```


## Errors

See the complete description of the ironSource errors ![](here|u.Errors).

