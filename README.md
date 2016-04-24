# Introduction
This kit contains the Checksum utility for setting up the Checksum Server at the Merchant's end.

# Mechanism
The Merchant needs to setup a server which will provide the functionality to generate and validate checksum. The files given in this utility need to be hosted on a webserver by the Merchant. Their respective URLs need to be configured in the App. The Checksum Validation URL will be the **Callback** URL.
More information about how the SDK work is given [here](http://paywithpaytm.com/developer/paytm_sdk_doc?target=how-paytm-sdk-works).

# Prerequisite
 1. Provide the value for PAYTM MERCHANT KEY in paytmCheckSumGenerator.jsp and paytmCheckSumVerify.jsp files. (The value for PAYTM MERCHANT KEY will be provided after the onboarding process is completed).
 
# Installation
 1. Copy the below mentioned files into the Webserver's *webapp* folder. This will be folder where you want to host your checksum project.
  - paytmCheckSumGenerator.jsp
  - paytmCheckSumVerify.jsp
 2. Copy the *paytm-checksum-1.0.jar* into the Webserver's *lib* folder.
