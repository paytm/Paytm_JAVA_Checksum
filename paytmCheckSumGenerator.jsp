<%@page import="com.google.gson.GsonBuilder"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.google.gson.Gson"%>
<%@ page import="java.util.*,
				java.net.URLEncoder,
				com.paytm.merchant.CheckSumServiceHelper"%>
<%

Enumeration<String> paramNames = request.getParameterNames();
Map<String, String[]> mapData = request.getParameterMap();
TreeMap<String,String> parameters = new TreeMap<String,String>();
TreeMap<String,String> parametersOut = new TreeMap<String,String>();
String paytmChecksum =  "";
parameters.put("MID","");	
parameters.put("ORDER_ID","");
parameters.put("INDUSTRY_TYPE_ID","");
parameters.put("CHANNEL_ID","");
parameters.put("TXN_AMOUNT","");
parameters.put("CUST_ID","");
parameters.put("WEBSITE","");

while(paramNames.hasMoreElements()) {
	String paramName = (String)paramNames.nextElement();
	String paramValue = (String)mapData.get(paramName)[0];

	//// below code snippet is mandatory, so that no one can use your checksumgeneration url for other purpose .
	if(paramValue.toLowerCase().contains("refund"){
		continue;
	}

	parameters.put(paramName,paramValue);	
}


	String checkSum =  CheckSumServiceHelper.getCheckSumServiceHelper().genrateCheckSum("PAYTM MERCHANT KEY", parameters);
	parametersOut.put("CHECKSUMHASH",checkSum);
	parametersOut.put("payt_STATUS","1");
	parametersOut.put("ORDER_ID",mapData.get("ORDER_ID")[0]);
	Gson gson = new GsonBuilder().disableHtmlEscaping().create();
	out.println(gson.toJson(parameters));

%>
