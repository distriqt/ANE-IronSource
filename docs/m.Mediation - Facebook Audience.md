
This guide shows how to add mediation through Facebook Audience to your IronSource integration.


## Step 1: Set up Facebook Audience Network 

Setup Facebook Audience network:

https://developers.ironsrc.com/ironsource-mobile/air/facebook-mediation-guide/#step-1



## Step 2: Configure mediation settings in IronSource

There are 3 pieces of Data from the Facebook Audience Network account which need to be inserted into your ironSource Network Setup Module in order for Facebook Audience Network to work correctly in connection with ironSource. See the IronSource guide for more information:

https://developers.ironsrc.com/ironsource-mobile/air/facebook-mediation-guide/#step-7



## Step 3: Import the Facebook Audience Network SDK and adapter ANE

The `com.distriqt.ironsource.FacebookAudience` ANE includes the Facebook Audience SDK and the IronSource Facebook mediation adapter. This is everything you need to get Facebook mediation working in your application.

To add the ANE download it from the repository and add it to your application:

- [com.distriqt.ironsource.FacebookAudience.ane](https://github.com/distriqt/ANE-IronSource/raw/master/lib/facebookaudience/com.distriqt.ironsource.FacebookAudience.ane)

Add the extension id to your application descriptor:

```xml
<extensions>
    <extensionID>com.distriqt.Core</extensionID>
    <extensionID>com.distriqt.IronSource</extensionID>

    <extensionID>com.distriqt.ironsource.FacebookAudience</extensionID>

    <extensionID>com.distriqt.playservices.Base</extensionID>
    <extensionID>com.distriqt.playservices.Ads</extensionID>

    <extensionID>androidx.core</extensionID>
</extensions>
```

More information on adding ANEs in this [tutorial](https://airnativeextensions.github.io/tutorials/getting-started)



## Step 4: Additional code required

There is no additional code required just a few additional configuration options and files that need to be packaged with your application.


### Android

Add the `audience_network.dex` file to the root of your application package. (This file is located in the repository, this must be the same version as the extension).

Add the following to your manifest additions inside the `application` tag. 

```xml
<!-- Facebook -->
<activity
        android:name="com.facebook.ads.InterstitialAdActivity"
        android:hardwareAccelerated="true"
        android:configChanges="keyboardHidden|orientation|screenSize" />
<activity
        android:name="com.facebook.ads.AudienceNetworkActivity"
        android:hardwareAccelerated="true"
        android:configChanges="keyboardHidden|orientation|screenSize" />
```




### iOS


Add the `Frameworks` folder to your application package, ensuring the dynamic `FBAudienceNetwork.framework` is included along with any swift libraries (`dylib` files).

**You will need to resign your application following the guide below otherwise your build will likely fail signing validation.**











# Signing your iOS application

With AIR 27 Adobe partially added the ability to use dynamic frameworks in your iOS application, which works fine with frameworks you control however still has issues with third party frameworks.

Everything will work up to a point, however AIR will incorrectly sign your IPA and it will fail AppStore submission with an error from the Application Loader tool and installing development builds with a signature validation error.

**Please vote to resolve this issue here: [https://tracker.adobe.com/#/view/AIR-4198407](https://tracker.adobe.com/#/view/AIR-4198407)**



To get around this, before you upload or install your application you will need to run a script to resign your IPA. 
This script is available in the repository alongside the ANE in the `scripts` directory.

>
> **This script will only work on a macOS machine with Xcode installed and your certificate installed in Keychain**
>

Copy this script to a directory in your development environment.

Firstly edit the script to change the details of the IPA, provisioning profile and signing identity for your application. These details are located at the top of the script.


```
#####################################
## CONFIG

# You need to set the values below for your application
# We suggest they are full paths to the files. 

# The path to the ipa generated from your AIR application packaging
IPA="/path/to/yourApp.ipa"

# The distribution provisioning profile for your application
PROVISIONING_PROFILE="/path/to/profile.mobileprovision"

# The name of the signing identity. You get this by running the following in a terminal 
# and selecting the name of your distribution certificate:
# 
# security find-identity -v -p codesigning
SIGNING_IDENTITY="iPhone Distribution: XXXXXXXXX (XXXXX)"
```


Now open a Terminal at the script location. *You will need to run the script from this directory.*

```
./resign
```

This should output a few informational items to the console and then once complete you should have a new IPA file in the directory named: `yourApp_resigned.ipa`. If there were any errors or warnings displayed, make sure the information above is all correct.

This resigned IPA is the file you should use.



