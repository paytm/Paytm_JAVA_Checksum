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
		if(paramName.equals("CHECKSUMHASH")){
			paytmChecksum = mapData.get(paramName)[0];
		}else{
			parameters.put(paramName,mapData.get(paramName)[0]);
		}
	}
	boolean isValideChecksum = false;
	try{
		isValideChecksum = CheckSumServiceHelper.getCheckSumServiceHelper().verifycheckSum("PAYTM MERCHANT KEY",parameters,paytmChecksum);
		parameters.put("IS_CHECKSUM_VALID",isValideChecksum==true?"Y":"N");
	}catch(Exception e){
		parameters.put("IS_CHECKSUM_VALID",isValideChecksum==true?"Y":"N");	
	}
	
	//
	Gson gson = new GsonBuilder().disableHtmlEscaping().create();
	StringBuilder outputHtml = new StringBuilder();

	outputHtml.append("<html>");
	outputHtml.append("<head>");
	outputHtml.append("<meta http-equiv='Content-Type' content='text/html;charset=ISO-8859-I'>");
	outputHtml.append("<title>Paytm</title>");
	outputHtml.append("<script type='text/javascript'>");
	outputHtml.append("function response(){");
	outputHtml.append("return document.getElementById('response').value;");
	outputHtml.append("}");
	outputHtml.append("</script>");
	outputHtml.append("</head>");
	outputHtml.append("<body>");
	outputHtml.append("Redirect back to the app<br>");
	outputHtml.append("<form name='frm' method='post'>");
	outputHtml.append("<input type='hidden' id='response' name='responseField' value='" + gson.toJson(parameters) + "'");
	outputHtml.append("</form>");
	outputHtml.append("</body>");
	outputHtml.append("</html>");
	out.println(outputHtml);
	
	
	
%>