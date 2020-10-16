
This guide shows how to add mediation through Amazon to your IronSource integration.


## Step 1: Create an Amazon Account 

1. To access Amazon’s ad inventory through ironSource‘s mediation platform, you must create an account with Amazon. You can do so [here](https://developer.amazon.com/mobile-ads?).


## Step 2: Create an Application in Amazon

Next, you must add the app in your Amazon account.

https://developers.ironsrc.com/ironsource-mobile/android/amazon-mobile-ad-network-integration-guide/#step-2


## Step 3: Activate Amazon in Your ironSource Network Setup Module

Serving Amazon’s ads through the ironSource mediation platform has never been this easy. Sign in to your Amazon account when setting up Amazon on the ironSource SDK Networks setup page and we’ll automatically retrieve all the necessary parameters to run Amazon’s Banners for you!

See the following guide for more information:

https://developers.ironsrc.com/ironsource-mobile/android/amazon-mobile-ad-network-integration-guide/#step-3



## Step 4. Add the Amazon Adapter to Your Build

The `com.distriqt.ironsource.Amazon` ANE includes the Amazon SDK and the IronSource Amazon mediation adapter. This is everything you need to get Amazon mediation working in your application.

To add the ANE download it from the repository and add it to your application:

- [com.distriqt.ironsource.Amazon](https://github.com/distriqt/ANE-IronSource/raw/master/lib/amazon/com.distriqt.ironsource.Amazon.ane)

Add the extension id to your application descriptor:

```xml
<extensions>
    <extensionID>com.distriqt.Core</extensionID>
    <extensionID>com.distriqt.IronSource</extensionID>

    <extensionID>com.distriqt.ironsource.Amazon</extensionID>

    <extensionID>com.distriqt.playservices.Base</extensionID>

    <extensionID>androidx.core</extensionID>
</extensions>
```

More information on adding ANEs in this [tutorial](https://airnativeextensions.github.io/tutorials/getting-started)



## Step 5: Additional code required

There is no additional code required just a few additional configuration options and files that need to be packaged with your application.


### Android

Add the following to your manifest additions inside the `application` tag. 


```xml
<!-- AMAZON -->
<activity
    android:name="com.amazon.device.ads.AdActivity"
    android:configChanges="keyboardHidden|orientation|screenSize" />
```





