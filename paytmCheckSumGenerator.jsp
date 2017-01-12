<%@page import="com.google.gson.GsonBuilder"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.google.gson.Gson"%>
<%@ page import="java.util.*,
				java.net.URLEncoder,
				com.paytm.merchant.CheckSumServiceHelper"%>
<%

boolean hasSecurityIssue = false;
Enumeration<String> paramNames = request.getParameterNames();
Map<String, String[]> mapData = request.getParameterMap();
TreeMap<String,String> parameters = new TreeMap<String,String>();
String paytmChecksum =  "";

while(paramNames.hasMoreElements()) {
	String paramName = (String)paramNames.nextElement();
	String paramValue = (String)mapData.get(paramName)[0];
	
	//// below code snippet is mandatory, so that no one can use your checksumgeneration url for other purpose .
	if(paramValue.toLowerCase().contains("refund"){
		hasSecurityIssue = true;
		break;
	}

	parameters.put(paramName,paramValue);	
}

if(hasSecurityIssue){
	out.println("Invalid Request !");
	out.println("Security Compromise, Checksum cannot be created with the request");
}else{
	String checkSum =  CheckSumServiceHelper.getCheckSumServiceHelper().genrateCheckSum("PAYTM MERCHANT KEY", parameters);
	parameters.put("CHECKSUMHASH",checkSum);
	parameters.put("payt_STATUS","1");
	Gson gson = new GsonBuilder().disableHtmlEscaping().create();
	out.println(gson.toJson(parameters));
}
%>
