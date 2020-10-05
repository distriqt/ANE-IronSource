
## AppLovin Mediation

This guide shows how to add mediation through AppLovin to your IronSource integration.


## Step 1: Create an AppLovin Account 

1. Create an account with AppLovin. You can do so [here](https://www.applovin.com/signup).

2. Once your account has been verified you can login at their partner login [here](https://www.applovin.com/login).


## Step 2: Retrieve Your AppLovin SDK and Report Keys

There are 2 pieces of data from the AppLovin account which need to be inserted into your ironSource Network Setup Module in order for AppLovin to work correctly in connection with ironSource:

- Report Key: This is a unique identifier for your AppLovin account, which allows your ironSource Mediation Platform to import performance data from your AppLovin account to use in reporting & optimization.
- SDK Key: This is a unique identifier for your AppLovin account. This is used by the ironSource Mediation SDK to Init the AppLovin Adapter for your apps.

Once you obtain this information, you must configure the AppLovin parameters in your ironSource Account. By adding the above information correctly, you will be able to take full advantage of AppLovin’s ad inventory and reporting data on ironSource’s Mediation platform.


https://developers.ironsrc.com/ironsource-mobile/android/applovin-mediation-guide/#step-2


## Step 3: Activate AppLovin on the ironSource SDK Networks Module

Configure AppLovin’s Parameters into ironSource Account

See the following guide for more information:

https://developers.ironsrc.com/ironsource-mobile/android/applovin-mediation-guide/#step-3



## Step 4. Add the AppLovin Adapter to Your Build

The `com.distriqt.ironsource.AppLovin` ANE includes the AppLovin SDK and the IronSource AppLovin mediation adapter. This is everything you need to get AppLovin mediation working in your application.

To add the ANE download it from the repository and add it to your application:

- [com.distriqt.ironsource.AppLovin](https://github.com/distriqt/ANE-IronSource/raw/master/lib/applovin/com.distriqt.ironsource.AppLovin.ane)

Add the extension id to your application descriptor:

```xml
<extensions>
    <extensionID>com.distriqt.Core</extensionID>
    <extensionID>com.distriqt.IronSource</extensionID>

    <extensionID>com.distriqt.ironsource.AppLovin</extensionID>

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
<!-- AppLovin -->
<activity
    android:name="com.applovin.adview.AppLovinInterstitialActivity"
    android:configChanges="orientation|screenSize|smallestScreenSize|screenLayout|uiMode"
    android:hardwareAccelerated="true"
    android:screenOrientation="behind"/>

<activity
    android:name="com.applovin.adview.AppLovinFullscreenActivity"
    android:configChanges="keyboard|keyboardHidden|locale|orientation|screenLayout|screenSize|smallestScreenSize|uiMode"
    android:exported="false"
    android:hardwareAccelerated="true"
    android:launchMode="singleTop"
    android:screenOrientation="behind"/>

<activity
    android:name="com.applovin.sdk.AppLovinWebViewActivity"
    android:configChanges="keyboardHidden|orientation|screenSize|uiMode"/>
```


### iOS 

Nothing additional required




