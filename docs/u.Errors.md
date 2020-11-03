

ironSource provides an error code mechanism to help you understand errors you may run into during integration or live production. Extract the error data from the Event object as follows:

```as3
var errorCode:String;
var errorDescription:String;
                
if(event.data)
{
   var error:Object = JSON.parse(event.data);
   errorDescription = error.error_description;
   errorCode = error.error_code;
}
```

## Error Codes

ironSource provides an error feedback mechanism to provide explanation for any failure in the SDK integration.
You will receive these errors when something went wrong or an aspect of the integration wasn’t completed correctly.

The ironSource Error object contains an error code and message. 
These are all the possible errors and their message based on their functions:


| Error Codes | Ad Unit | Description | 
| --- | --- | --- |
| 508 | N/A | - Init failure of the mediation/Network <br/> - Calling a Demand Only API in non Demand Only mode<br/> - Calling a non Demand Only API in Demand Only mode |
| 509 | Interstital<br/>Rewarded Video<br/>Offerwall | Show Fail: No ads to show |
| 510 | Interstitial | Load Fail: Server response failed <br/> Load Fail: Adapters loading failure |
| 520 | Interstitial | Show Fail: No internet connection; <br/>ShouldTrackNetworkState is enabled |
| | Rewarded Video <br/> Offerwall | Show Fail: No internet connection |
| 524 | Interstitial<br/>Rewarded Video<br/>Offerwall | Show Fail: Placement %@ has reached its limit as defined per pace<br/> Show Fail: Placement %@ has reached its capping limit |
| 526 | Interstitial <br/>Rewarded Video | Show Fail: Ad unit has reached its daily cap per session |
| 527 | Interstitial<br/>Rewarded Video | Load Fail: Instance does not exist in the waterfall<br/>Show Fail: Instance does not exist in the waterfall |
| 1022 | Rewarded Video | Show Fail: Cannot show an RV while another RV is showing |
| 1023 | Rewarded Video | Show Fail: Show RV called when there are no available ads to show |
| 1036 | Interstitial | Show Fail: Cannot show an interstitial while another interstitial is showing |
| 1037 | Interstitial | Load Fail: Cannot load an interstitial while another interstitial is showing |