
Before starting to use the Iron Source SDK you must call `init()` with your Iron Source application key and specify the ad unit types you will be using in your application.

For example:

```as3
IronSource.instance.init( IRONSRC_APP_KEY,
                            [
                                IronSource.REWARDED_VIDEO,
                                IronSource.INTERSTITIAL
                            ]
);
```




### Validate Integration

You can test the state of the integration by calling the `validateIntegration()` function. 

```as3
IronSource.instance.validateIntegration();
```

This will output information about the current SDK integration to the native device log. Check [here](https://airnativeextensions.github.io/tutorials/device-logs) for information on how to access device logs. 


