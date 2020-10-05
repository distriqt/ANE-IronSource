
## UnityAds Mediation

This guide shows how to add mediation through UnityAds to your IronSource integration.


## Step 1: Create a UnityAds Account

1. Create an account with UnityAds. You can do so [here](https://operate.dashboard.unity3d.com/).

2. Once your account has been verified you can log in at their partner login [here](https://operate.dashboard.unity3d.com/).





## Step 2: Create an Application and Placement in UnityAds

Follow these steps to create your UnityAds application:

https://developers.ironsrc.com/ironsource-mobile/android/unityads-mediation-guide/#step-2



## Step 3: Activate UnityAds on ironSource Network SDK Setup

https://developers.ironsrc.com/ironsource-mobile/android/unityads-mediation-guide/#step-3



## Step 4: Add the UnityAds Adapter to Your Build

The `com.distriqt.ironsource.UnityAds` ANE includes the UnityAds SDK and the IronSource UnityAds mediation adapter. This is everything you need to get UnityAds mediation working in your application.

To add the ANE download it from the repository and add it to your application:

- [com.distriqt.ironsource.UnityAds](https://github.com/distriqt/ANE-IronSource/raw/master/lib/unityads/com.distriqt.ironsource.UnityAds.ane)

Add the extension id to your application descriptor:

```xml
<extensions>
    <extensionID>com.distriqt.Core</extensionID>
    <extensionID>com.distriqt.IronSource</extensionID>

    <extensionID>com.distriqt.ironsource.UnityAds</extensionID>

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
<!-- UNITY ADS -->
<activity
    android:name="com.unity3d.services.ads.adunit.AdUnitActivity"
    android:configChanges="fontScale|keyboard|keyboardHidden|locale|mnc|mcc|navigation|orientation|screenLayout|screenSize|smallestScreenSize|uiMode|touchscreen"
    android:hardwareAccelerated="true"
    android:theme="@android:style/Theme.NoTitleBar.Fullscreen" />
<activity
    android:name="com.unity3d.services.ads.adunit.AdUnitTransparentActivity"
    android:configChanges="fontScale|keyboard|keyboardHidden|locale|mnc|mcc|navigation|orientation|screenLayout|screenSize|smallestScreenSize|uiMode|touchscreen"
    android:hardwareAccelerated="true"
    android:theme="@android:style/Theme.Translucent.NoTitleBar.Fullscreen" />
<activity
    android:name="com.unity3d.services.ads.adunit.AdUnitTransparentSoftwareActivity"
    android:configChanges="fontScale|keyboard|keyboardHidden|locale|mnc|mcc|navigation|orientation|screenLayout|screenSize|smallestScreenSize|uiMode|touchscreen"
    android:hardwareAccelerated="false"
    android:theme="@android:style/Theme.Translucent.NoTitleBar.Fullscreen" />
<activity
    android:name="com.unity3d.services.ads.adunit.AdUnitSoftwareActivity"
    android:configChanges="fontScale|keyboard|keyboardHidden|locale|mnc|mcc|navigation|orientation|screenLayout|screenSize|smallestScreenSize|uiMode|touchscreen"
    android:hardwareAccelerated="false"
    android:theme="@android:style/Theme.NoTitleBar.Fullscreen" />
```


### iOS 


Add the following to your `InfoAdditions` node updating the usage description strings as required for your application:

```xml
<key>NSAppTransportSecurity</key>
<dict>
  <key>NSExceptionDomains</key>
   <dict>
       <key>localhost</key>
       <dict>           
           <key>NSExceptionAllowsInsecureHTTPLoads</key>
           <true/>
       </dict>
   </dict>
</dict>
```



