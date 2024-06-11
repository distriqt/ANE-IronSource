built by [distriqt //](https://airnativeextensions.com) 



>
> This extension is provided for **free**. If it helps you please consider sponsoring the developers to continue support and development of the extension:
>
> [:heart: Sponsor](https://github.com/sponsors/marchbold)
>
> This is not an official extension and is not endorsed or sponsored by ironSource.
>


# IronSource

ironSource is an AIR Native Extension to access the [ironSource](https://www.is.com/) advertising SDK for in app monetisation.

We developed this extension so we can update it to match the latest native versions without waiting for updates from IronSource directly, which seem to be given a lower priority and lag behind the native SDKs.



#### Features

- Monetization - One of the industry’s largest in-app ad networks leveraging all available ad units to drive revenue and user engagement.
- Single API interface - your code works across supported platforms with no modifications
- Sample project code and ASDocs reference
- Mediation:
  - AdColony
  - AdMob
  - AppLovin
  - Chartboost
  - Facebook Audience
  - Tapjoy
  - UnityAds



## Documentation

The [documentation site](https://docs.airnativeextensions.com/docs/ironsource/) forms the best source of detailed documentation for the extension along with the [asdocs](https://docs.airnativeextensions.com/asdocs/ironsource/). 


Quick Example: 

```actionscript
IronSource.instance.init( Config.IRONSRC_APP_KEY, [ IronSource.REWARDED_VIDEO ] );

if (IronSource.instance.isRewardedVideoAvailable())
{
    IronSource.instance.showRewardedVideo();
}
```



## Native Extensions

The highest quality and widest range of Native Extensions for Adobe AIR

With many native extensions available, we are the largest provider of native extensions for AIR developers. 
Our mobile solutions allow developers to fast-forward development and focus on building great games and apps.

[https://airnativeextensions.com](https://airnativeextensions.com)



