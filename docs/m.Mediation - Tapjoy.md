
This guide shows how to add mediation through Tapjoy to your IronSource integration.


## Step 1: Create a Tapjoy Account

1. Create an account with Tapjoy. You can do so [here](https://ltv.tapjoy.com/s/l#session/signup).

2. Click on the link in the confirmation email to verify your account. Once your account has been verified, you can log in to their partner login [here](https://ltv.tapjoy.com/s/l#session/login).




## Step 2: Create an Application in Tapjoy

To gain access to Tapjoy’s inventory within ironSource‘s Mediation platform, you must first add your app and set up Ad Zones in your Tapjoy account.

https://developers.ironsrc.com/ironsource-mobile/android/tapjoy-mediation-guide/#step-2



## Step 3: Add Placement, Virtual Currency and Content

https://developers.ironsrc.com/ironsource-mobile/android/tapjoy-mediation-guide/#step-3



## Step 4: Activate Tapjoy on ironSource SDK Networks Module

There are a few pieces of data from your Tapjoy account which need to be inserted into your ironSource Network Setup Module in order for Tapjoy to work correctly in connection with ironSource

See the following guide for more information:

https://developers.ironsrc.com/ironsource-mobile/android/tapjoy-mediation-guide/#step-4



## Step 5: Add the Tapjoy Adapter to Your Build

The `com.distriqt.ironsource.Tapjoy` ANE includes the Tapjoy SDK and the IronSource Tapjoy mediation adapter. This is everything you need to get Tapjoy mediation working in your application.

To add the ANE download it from the repository and add it to your application:

- [com.distriqt.ironsource.Tapjoy](https://github.com/distriqt/ANE-IronSource/raw/master/lib/tapjoy/com.distriqt.ironsource.Tapjoy.ane)

Add the extension id to your application descriptor:

```xml
<extensions>
    <extensionID>com.distriqt.Core</extensionID>
    <extensionID>com.distriqt.IronSource</extensionID>

    <extensionID>com.distriqt.ironsource.Tapjoy</extensionID>

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
<!-- TAPJOY -->
<activity
    android:name="com.tapjoy.TJAdUnitActivity"
    android:configChanges="orientation|keyboardHidden|screenSize"
    android:hardwareAccelerated="true"
    android:theme="@android:style/Theme.Translucent.NoTitleBar.Fullscreen" />
<activity
    android:name="com.tapjoy.TJContentActivity"
    android:configChanges="orientation|keyboardHidden|screenSize"
    android:hardwareAccelerated="true"
    android:theme="@android:style/Theme.Translucent.NoTitleBar" />

<receiver android:name="com.tapjoy.TapjoyReceiver" />
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



