
This guide shows how to add mediation through AdColony to your IronSource integration.


## Step 1: Create an AdColony Account 

1. Create an account with AdColony. You can do so [here](https://clients.adcolony.com/signup).

2. Once your account has been verified, you can log in to their partner login [here](https://clients.adcolony.com/login).


## Step 2: Create an Application and Ad Zone in AdColony

To gain access to AdColony’s inventory within ironSource’s Mediation platform, you must first add your app and set up Ad Zones in your AdColony account.

https://developers.ironsrc.com/ironsource-mobile/android/adcolony-mediation-guide/#step-2


## Step 3: Activate AdColony in the SDK Networks Setup Module

There are a few parameters from your AdColony account which need to be inserted into your SDK Network Setup Module on the ironSource platform in order for AdColony to work correctly in connection with ironSource. 

See the following guide for more information:

https://developers.ironsrc.com/ironsource-mobile/android/adcolony-mediation-guide/#step-3



## Step 4. Add the AdColony Adapter to Your Build

The `com.distriqt.ironsource.AdColony` ANE includes the AdColony SDK and the IronSource AdColony mediation adapter. This is everything you need to get AdColony mediation working in your application.

To add the ANE download it from the repository and add it to your application:

- [com.distriqt.ironsource.AdColony](https://github.com/distriqt/ANE-IronSource/raw/master/lib/adcolony/com.distriqt.ironsource.AdColony.ane)

Add the extension id to your application descriptor:

```xml
<extensions>
    <extensionID>com.distriqt.Core</extensionID>
    <extensionID>com.distriqt.IronSource</extensionID>

    <extensionID>com.distriqt.ironsource.AdColony</extensionID>

    <extensionID>com.distriqt.playservices.Base</extensionID>
    <extensionID>com.distriqt.playservices.Ads</extensionID>
    <extensionID>com.distriqt.playservices.AdsIdentifier</extensionID>

    <extensionID>androidx.core</extensionID>
</extensions>
```

More information on adding ANEs in this [tutorial](https://airnativeextensions.github.io/tutorials/getting-started)



## Step 5: Additional code required

There is no additional code required just a few additional configuration options and files that need to be packaged with your application.


### Android

Add the following to your manifest additions inside the `application` tag. 

```xml
<!-- AdColony -->
<activity
    android:name="com.adcolony.sdk.AdColonyInterstitialActivity"
    android:configChanges="keyboardHidden|orientation|screenSize"
    android:hardwareAccelerated="true" />

<activity android:name="com.adcolony.sdk.AdColonyAdViewActivity"
    android:configChanges="keyboardHidden|orientation|screenSize"
    android:hardwareAccelerated="true"/>
```



### iOS


Add the following to your `InfoAdditions` node updating the usage description strings as required for your application:

```xml
<key>LSApplicationQueriesSchemes</key>
<array>
    <string>fb</string>
    <string>instagram</string>
    <string>tumblr</string>
    <string>twitter</string>
</array>

<key>NSCalendarsUsageDescription</key>
<string>Adding events</string>
<key>NSPhotoLibraryUsageDescription</key>
<string>Taking selfies</string>
<key>NSCameraUsageDescription</key>
<string>Taking selfies</string>
<key>NSMotionUsageDescription </key>
<string>Interactive ad controls</string>
```


