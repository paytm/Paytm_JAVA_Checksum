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
String paytmChecksum =  "";
while(paramNames.hasMoreElements()) {
	String paramName = (String)paramNames.nextElement();
	parameters.put(paramName,mapData.get(paramName)[0]);	
}

String checkSum =  CheckSumServiceHelper.getCheckSumServiceHelper().genrateCheckSum("PAYTM MERCHANT KEY", parameters);
parameters.put("CHECKSUMHASH",checkSum);
parameters.put("payt_STATUS","1");
Gson gson = new GsonBuilder().disableHtmlEscaping().create();
out.println(gson.toJson(parameters));

%>
