package com.paytm.pg.checksumKit;

import com.paytm.pg.merchant.*;

import java.util.Map;
import java.util.TreeMap;

public class checksumVerification {
	
	private static String MercahntKey = "XXXXXXXXXXX";
	
	public static void main(String[] a){
		
		String paytmChecksum = "";
		
		Map<String, String> mapData = new  TreeMap<String,String>();
		
		TreeMap<String, String> paytmParams = new  TreeMap<String,String>();
		
		for (Map.Entry<String, String> entry : mapData.entrySet())
		{   
		    if(entry.getKey().equals("CHECKSUMHASH")){
				paytmChecksum = entry.getKey();
			}else{
				paytmParams.put(entry.getKey(), entry.getValue());
			}
		}
		
		
		boolean isValideChecksum = false;
		try{
			
			isValideChecksum = CheckSumServiceHelper.getCheckSumServiceHelper().verifycheckSum(MercahntKey, paytmParams, paytmChecksum);
			
			System.out.println(isValideChecksum);
			
			// if checksum is validated Kindly verify the amount and status 
			// if transaction is successful 
			// kindly call Paytm Transaction Status API and verify the transaction amount and status.
			// If everything is fine then mark that transaction as successful into your DB.
			
			
		}catch(Exception e){
			e.printStackTrace();
		}
	}
}
