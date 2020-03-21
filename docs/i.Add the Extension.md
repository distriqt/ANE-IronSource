
## Add the Extension

First step is always to add the extension to your development environment. 
To do this use the tutorial located [here](https://airnativeextensions.github.io/tutorials/getting-started).



## Dependencies

Many of our extensions use some common libraries, for example, the Android Support libraries.

We have to separate these libraries into separate extensions in order to avoid multiple versions of the libraries being included in your application and causing packaging conflicts. This means that you need to include some additional extensions in your application along with the main extension file.

You will add these extensions as you do with any other extension, and you need to ensure it is packaged with your application.


### Core 

The Core ANE is required by this ANE. You must include and package this extension in your application.

The Core ANE doesn't provide any functionality in itself but provides support libraries and frameworks used by our extensions.
It also includes some centralised code for some common actions that can cause issues if they are implemented in each individual extension.

You can access this extension here: [https://github.com/distriqt/ANE-Core](https://github.com/distriqt/ANE-Core).


### Android Support

The Android Support libraries encompass the Android Support, Android X and common Google libraries. 

These libraries are specific to Android. There are no issues including these on all platforms, they are just **required** for Android.

This extension requires the following extensions:

- [androidx.core.ane](https://github.com/distriqt/ANE-AndroidSupport/raw/master/lib/androidx.core.ane)

You can access these extensions here: [https://github.com/distriqt/ANE-AndroidSupport](https://github.com/distriqt/ANE-AndroidSupport).


>
> **Note**: if you have been using the older `com.distriqt.androidsupport.*` (Android Support) extensions you should remove these extensions and replace it with the `androidx` extensions listed above. This is the new version of the android support libraries and moving forward all our extensions will require AndroidX.
>



### Google Play Services 

This extension requires usage of certain aspects of the Google Play Services client library. 
The client library is available as a series of extensions that you add into your applications packaging options. 
Each separate extension provides a component(s) from the Play Services client library and are used by different extensions. 
These client libraries aren't packaged with this extension as they are used by multiple ANEs and separating them 
will avoid conflicts, allowing you to use multiple extensions in the one application.

This extension requires the following Google Play Services:

- [com.distriqt.playservices.Base.ane](https://github.com/distriqt/ANE-GooglePlayServices/raw/master/lib/com.distriqt.playservices.Base.ane)
- [com.distriqt.playservices.Ads.ane](https://github.com/distriqt/ANE-GooglePlayServices/raw/master/lib/com.distriqt.playservices.Ads.ane)

You must include the above native extensions in your application along with this extension, 
and you need to ensure they are packaged with your application.

You can access the Google Play Services client library extensions here: 
[https://github.com/distriqt/ANE-GooglePlayServices](https://github.com/distriqt/ANE-GooglePlayServices).


>
> **Note:** The Google Play Services and Android Support ANEs are only **required** on Android devices. 
> There are no issues packaging these extensions with all platforms as there are default implementations available which will allow your code to package without errors however if you are only building an iOS application feel free to remove the Google Play Services and Android Support ANEs from your application.
>


## Extension IDs

The following should be added to your `extensions` node in your application descriptor to identify all the required ANEs in your application:

```xml
<extensions>
	<extensionID>com.distriqt.IronSource</extensionID>
	<extensionID>com.distriqt.Core</extensionID>
	<extensionID>com.distriqt.playservices.Ads</extensionID>
	<extensionID>com.distriqt.playservices.Base</extensionID>
	
    <extensionID>androidx.core</extensionID>
</extensions>
```


## Android 

### Manifest Additions 

The IronSource ANE requires a few additions to the manifest to be able to start certain activities. You should add the listing below to your manifest additions.

```xml
<uses-sdk android:minSdkVersion="14" android:targetSdkVersion="28" />

<uses-permission android:name="android.permission.INTERNET"/>
<uses-permission android:name="android.permission.ACCESS_NETWORK_STATE" />

<application android:hardwareAccelerated="true">

    <meta-data android:name="com.google.android.gms.version" android:value="@integer/google_play_services_version" />

    <activity
        android:name="com.ironsource.sdk.controller.ControllerActivity"
        android:configChanges="orientation|screenSize"
        android:hardwareAccelerated="true" />
    <activity
        android:name="com.ironsource.sdk.controller.InterstitialActivity"
        android:configChanges="orientation|screenSize"
        android:hardwareAccelerated="true"
        android:theme="@android:style/Theme.Translucent" />
    <activity
        android:name="com.ironsource.sdk.controller.OpenUrlActivity"
        android:configChanges="orientation|screenSize"
        android:hardwareAccelerated="true"
        android:theme="@android:style/Theme.Translucent" />

</application>
```


## iOS 

### Info Additions


App Transport Security (ATS) is a privacy feature introduced in iOS 9. It's enabled 
by default for new applications and enforces secure connections.

All iOS 9 or higher devices running apps that don't disable ATS will be affected by 
this change. This may affect your app's integration with the Google Mobile Ads SDK.

The following log message appears when a non-ATS compliant app attempts to serve an 
ad via HTTP on iOS 9 or iOS 10:

> App Transport Security has blocked a cleartext HTTP (http://) resource load since it is insecure. Temporary exceptions can be configured via your app's Info.plist file.

To ensure your ads are not impacted by ATS, add the following to the `InfoAdditions`
node in your `iPhone` settings of your application descriptor:

```xml
<key>NSAppTransportSecurity</key>
<dict>
	<key>NSAllowsArbitraryLoads</key>
	<true/>
	<key>NSAllowsArbitraryLoadsForMedia</key>
	<true/>
	<key>NSAllowsArbitraryLoadsInWebContent</key>
	<true/>
</dict>
```

The `NSAllowsArbitraryLoads` exception is required to make sure your ads are not 
impacted by ATS on iOS 9 devices, while `NSAllowsArbitraryLoadsForMedia` and 
`NSAllowsAribtraryLoadsInWebContent` are required to make sure your ads are 
not impacted by ATS on iOS 10 devices.


Example:


```xml
<iPhone>
	<InfoAdditions><![CDATA[
		<key>UIDeviceFamily</key>
		<array>
			<string>1</string>
			<string>2</string>
		</array>

		<key>NSAppTransportSecurity</key>
		<dict>
			<key>NSAllowsArbitraryLoads</key>
			<true/>
			<key>NSAllowsArbitraryLoadsForMedia</key>
			<true/>
			<key>NSAllowsArbitraryLoadsInWebContent</key>
			<true/>
		</dict>

		<key>GADApplicationIdentifier</key>
		<string>ca-app-pub-AAAAAAAAAAAAAAAA~XXXXXXXXXX</string>
	)></InfoAdditions>
	<requestedDisplayResolution>high</requestedDisplayResolution>
	<Entitlements>
		<![CDATA[
		)>
	</Entitlements>
</iPhone>
```




## Checking for Support

You can use the `isSupported` flag to determine if this extension is supported on the current platform and device.

This allows you to react to whether the functionality is available on the device and provide an alternative solution if not.


```as3
if (IronSource.isSupported)
{
	// Functionality here
}
```


