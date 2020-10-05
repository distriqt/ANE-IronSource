
## Chartboost Mediation

This guide shows how to add mediation through Chartboost to your IronSource integration.


## Step 1: Create an Chartboost Account 

1. Create an account with Chartboost. You can do so [here](https://www.chartboost.com/signup/).

2. Once your account has been verified you can login at their partner login [here](https://dashboard.chartboost.com/login).



## Step 2: Create an Application in Chartboost

Setup your Chartboost account and create an application:

https://developers.ironsrc.com/ironsource-mobile/android/chartboost-mediation-guide/#step-2



## Step 3: Create a Chartboost Publishing Campaign

In order to serve Chartboost’s ad inventory in your app through the ironSource Mediation platform, you must create a publishing campaign on Chartboost.

https://developers.ironsrc.com/ironsource-mobile/android/chartboost-mediation-guide/#step-3



## Step 4: Activate Chartboost on ironSource SDK Networks Module

There are 5 pieces of Data from the Chartboost account which need to be inserted into your ironSource Network Setup Module in order for Chartboost to work correctly in connection with ironSource

See the following guide for more information:

https://developers.ironsrc.com/ironsource-mobile/android/chartboost-mediation-guide/#step-4



## Step 5: Add the Chartboost Adapter to Your Build

The `com.distriqt.ironsource.Chartboost` ANE includes the Chartboost SDK and the IronSource Chartboost mediation adapter. This is everything you need to get Chartboost mediation working in your application.

To add the ANE download it from the repository and add it to your application:

- [com.distriqt.ironsource.Chartboost](https://github.com/distriqt/ANE-IronSource/raw/master/lib/chartboost/com.distriqt.ironsource.Chartboost.ane)

Add the extension id to your application descriptor:

```xml
<extensions>
    <extensionID>com.distriqt.Core</extensionID>
    <extensionID>com.distriqt.IronSource</extensionID>

    <extensionID>com.distriqt.ironsource.Chartboost</extensionID>

    <extensionID>com.distriqt.playservices.Base</extensionID>
    <extensionID>com.distriqt.playservices.Ads</extensionID>
    <extensionID>com.distriqt.playservices.AdsIdentifier</extensionID>

    <extensionID>androidx.core</extensionID>
</extensions>
```

More information on adding ANEs in this [tutorial](https://airnativeextensions.github.io/tutorials/getting-started)



## Step 6: Additional code required

There is no additional code required just a few additional configuration options and files that need to be packaged with your application.


### Android

Add the following to your manifest additions inside the `application` tag. 

```xml
<!-- CHARTBOOST -->
<activity
    android:name="com.chartboost.sdk.CBImpressionActivity"
    android:configChanges="keyboardHidden|orientation|screenSize"
    android:excludeFromRecents="true"
    android:hardwareAccelerated="true"
    android:theme="@android:style/Theme.Translucent.NoTitleBar.Fullscreen" />

<activity
    android:name="com.google.android.gms.common.api.GoogleApiActivity"
    android:exported="false"
    android:theme="@android:style/Theme.Translucent.NoTitleBar" />
```


### iOS 

Nothing additional required




