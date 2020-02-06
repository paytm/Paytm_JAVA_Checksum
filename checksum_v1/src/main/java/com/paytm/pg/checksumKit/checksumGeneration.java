package com.paytm.pg.checksumKit;

import com.paytm.pg.merchant.*;
import java.util.TreeMap;

public class checksumGeneration {
	
	//Below parameters provided by Paytm
	
	private static String MID = "XXXXXXXXXXXXXXXXXXXXXXXX"; 
	private static String MercahntKey = "XXXXXXXXXXXXXXXX";
	private static String INDUSTRY_TYPE_ID = "XXXXXXXXXXXX";
	private static String CHANNLE_ID = "WAP";
	private static String WEBSITE = "XXXXXXXXXX";
	private static String CALLBACK_URL = "XXXXXXXXXXXXXX";
	
	public static void main(String[] a){
		
		TreeMap<String,String> paramMap = new TreeMap<String,String>();
		paramMap.put("MID" , MID);
		paramMap.put("ORDER_ID" , "ORDER00011");
		paramMap.put("CUST_ID" , "CUST00011");
		paramMap.put("INDUSTRY_TYPE_ID" , INDUSTRY_TYPE_ID);
		paramMap.put("CHANNEL_ID" , CHANNLE_ID);
		paramMap.put("TXN_AMOUNT" , "1.00");
		paramMap.put("WEBSITE" , WEBSITE);
		paramMap.put("EMAIL" , "test@gmail.com");
		paramMap.put("MOBILE_NO" , "9999999999");
		paramMap.put("CALLBACK_URL" , CALLBACK_URL);
		
		try{
		String checkSum =  CheckSumServiceHelper.getCheckSumServiceHelper().genrateCheckSum(MercahntKey, paramMap);
		paramMap.put("CHECKSUMHASH" , checkSum);
		
		System.out.println("Paytm Payload: "+ paramMap);
		
		}catch(Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
