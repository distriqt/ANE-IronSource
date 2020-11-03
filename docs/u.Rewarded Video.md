
Rewarded videos are opt-in ad units that encourage users to watch a video in order to receive in-app rewards. 

![](images/rewarded-video.png)


## Availability 

To check if a rewarded video is available use the `isRewardedVideoAvailable()` flag:


```as3
if (IronSource.instance.isRewardedVideoAvailable())
{
    // Rewarded Video available    
}
```

You can also listen for the `RewardedVideoAdEvent.AVAILABILITY_CHANGED` event to determine when the value of this flag changes.


```as3
IronSource.instance.addEventListener( RewardedVideoAdEvent.AVAILABILITY_CHANGED, onRewardedVideoAvailabilityChanged );

function onRewardedVideoAvailabilityChanged( event:RewardedVideoAdEvent ):void
{
    trace( "onRewardedVideoAvailabilityChanged: " + event.availability );
}
```



## Show Rewarded Video

To display a rewarded video once one is available you call the `showRewardedVideo()` function:

```
if (IronSource.instance.isRewardedVideoAvailable())
{
    IronSource.instance.showRewardedVideo();
}
```

This will dispatch several events at different stages of the video:

- `RewardedVideoAdEvent.OPENED`: The rewarded video ad was opened;
- `RewardedVideoAdEvent.CLOSED`: The rewarded video ad was closed by the user;
- `RewardedVideoAdEvent.STARTED`: The rewarded video playback started;
- `RewardedVideoAdEvent.ENDED`: The rewarded video playback ended;
- `RewardedVideoAdEvent.REWARDED`: Dispatched when you should reward your user;
- `RewardedVideoAdEvent.SHOW_FAILED`: The rewarded video failed to be displayed;
- `RewardedVideoAdEvent.CLICKED`: Dispatched if the user clicks the rewarded video ad;




### Example


```as3
IronSource.instance.addEventListener( RewardedVideoAdEvent.OPENED, onRewardedVideoAdOpened );
IronSource.instance.addEventListener( RewardedVideoAdEvent.CLOSED, onRewardedVideoAdClosed );
IronSource.instance.addEventListener( RewardedVideoAdEvent.STARTED, onRewardedVideoAdStarted );
IronSource.instance.addEventListener( RewardedVideoAdEvent.ENDED, onRewardedVideoAdEnded );
IronSource.instance.addEventListener( RewardedVideoAdEvent.REWARDED, onRewardedVideoAdRewarded );
IronSource.instance.addEventListener( RewardedVideoAdEvent.SHOW_FAILED, onRewardedVideoAdShowFailed );
IronSource.instance.addEventListener( RewardedVideoAdEvent.CLICKED, onRewardedVideoAdClicked );


if (IronSource.instance.isRewardedVideoAvailable())
{
    IronSource.instance.showRewardedVideo();
}


function onRewardedVideoAdShowFailed( event:RewardedVideoAdEvent ):void
{
    trace( "onRewardedVideoAdShowFailed" );
}

function onRewardedVideoAdOpened( event:RewardedVideoAdEvent ):void
{
    trace( "onRewardedVideoAdOpened" );
}

function onRewardedVideoAdClosed( event:RewardedVideoAdEvent ):void
{
    trace( "onRewardedVideoAdClosed" );
}

function onRewardedVideoAdStarted( event:RewardedVideoAdEvent ):void
{
    trace( "onRewardedVideoAdStarted" );
}

function onRewardedVideoAdEnded( event:RewardedVideoAdEvent ):void
{
    trace( "onRewardedVideoAdEnded" );
}

function onRewardedVideoAdRewarded( event:RewardedVideoAdEvent ):void
{
    trace( "onRewardedVideoAdRewarded" );
}

function onRewardedVideoAdClicked( event:RewardedVideoAdEvent ):void
{
    trace( "onRewardedVideoAdClicked" );
}
```


## Errors

See the complete description of the ironSource errors ![](here|u.Errors).
