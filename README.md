# Introduction
This kit contains the Checksum utility for setting up the Checksum Server at the Merchant's end.

# Mechanism
The Merchant needs to setup a server which will provide the functionality to generate and validate checksum. The files given in this utility need to be hosted on a webserver by the Merchant. Their respective URLs need to be configured in the App. The Checksum Validation URL will be the **Callback** URL.
More information about how the SDK work is given [here](https://paytm-wallet-sdk.readme.io/docs/how-does-paytm-sdk-work).

# Installation
 1. Copy the below mentioned files into the Webserver's *webapp* folder. This will be folder where you want to host your checksum project.
  - paytmCheckSumGenerator.jsp
  - paytmCheckSumVerify.jsp
 2. Copy the *paytm-checksum-1.0.jar* into the Webserver's *lib* folder.
