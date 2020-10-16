
This guide shows how to add mediation through AdMob to your IronSource integration.


## Step 1: Create an AdMob Account 

1. To access AdMob’s ad inventory through ironSource‘s Mediation platform, you must create an account with AdMob. You can do so [here](https://www.google.com/admob/).

2. We recommend to adjust the time zone of your AdMob’s account to UTC to align with the ironSource dashboard. This will ensure accurate reporting. More info [here](https://support.google.com/admob/answer/7276705?hl=en).


## Step 2: Create an Application and Ad Zone in Admob

Next, you must add your app and set up Ad Zones in your Admob account.

https://developers.ironsrc.com/ironsource-mobile/android/admob-mediation-guide/#step-2


## Step 3: Activate AdMob in Your ironSource Network Setup Module

Serving Admob’s ads through the ironSource Mediation platform has never been this easy. Sign in to your Google account when setting up Admob on the ironSource SDK Networks Setup and we’ll retrieve all the necessary parameters to run Admob’s Interstitials, Rewarded Video and Banners for you!

See the following guide for more information:

https://developers.ironsrc.com/ironsource-mobile/android/admob-mediation-guide/#step-3



## Step 4. Add the AdMob Adapter to Your Build

The `com.distriqt.ironsource.AdMob` ANE includes the IronSource AdMob mediation adapter. This is everything you need to get AdMob mediation working in your application.

To add the ANE download it from the repository and add it to your application:

- [com.distriqt.ironsource.AdMob](https://github.com/distriqt/ANE-IronSource/raw/master/lib/admob/com.distriqt.ironsource.AdMob.ane)

Add the extension id to your application descriptor:

```xml
<extensions>
    <extensionID>com.distriqt.Core</extensionID>
    <extensionID>com.distriqt.IronSource</extensionID>

    <extensionID>com.distriqt.ironsource.AdMob</extensionID>

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

>
> You need to ensure you set the `android:value` for your AdMob application, replacing `ca-app-pub-XXXXXXXXXXXXXXXX~YYYYYYYYYY` in the additions below.
>

```xml
<!-- ADMOB -->
<activity
    android:name="com.google.android.gms.ads.AdActivity"
    android:configChanges="keyboard|keyboardHidden|orientation|screenLayout|uiMode|screenSize|smallestScreenSize"
    android:theme="@android:style/Theme.Translucent" />
<provider
    android:name="com.google.android.gms.ads.MobileAdsInitProvider"
    android:authorities="air.com.distriqt.test.mobileadsinitprovider"
    android:exported="false"
    android:initOrder="100" />

<meta-data
    android:name="com.google.android.gms.ads.APPLICATION_ID"
    android:value="ca-app-pub-XXXXXXXXXXXXXXXX~YYYYYYYYYY"/>
```



### iOS


Add the following to your `InfoAdditions` node updating the usage description strings as required for your application:

>
> You need to ensure you set the `GADApplicationIdentifier` for your AdMob application, replacing `ca-app-pub-XXXXXXXXXXXXXXXX~YYYYYYYYYY` in the additions below.
>

```xml
<key>GADApplicationIdentifier</key>
<string>ca-app-pub-XXXXXXXXXXXXXXXX~YYYYYYYYYY</string>

<key>SKAdNetworkItems</key>
<array>
    <dict>
        <key>SKAdNetworkIdentifier</key>
        <string>cstr6suwn9.skadnetwork</string>
    </dict>
</array>
```


