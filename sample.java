import com.paytm.pg.merchant.*;
import java.util.TreeMap;

public class Sample {

    public static void main(String[] args) throws Exception {

        /* initialize an hash */
        TreeMap<String, String> params = new TreeMap<String, String>();
        params.put("MID", "YOUR_MID_HERE");
        params.put("ORDERID", "YOUR_ORDERID_HERE");
        /**
         * Generate checksum by parameters we have
         * Find your Merchant Key in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys
         */
        String paytmChecksum = PaytmChecksum.generateSignature(params, "YOUR_MERCHANT_KEY");
        boolean verifySignature = PaytmChecksum.verifySignature(params, "YOUR_MERCHANT_KEY", paytmChecksum);
        System.out.println("generateSignature Returns: " + paytmChecksum);
        System.out.println("verifySignature Returns: " + verifySignature);


        /* initialize JSON String */
        String body = "{\"mid\":\"YOUR_MID_HERE\",\"orderId\":\"YOUR_ORDER_ID_HERE\"}";

        /**
         * Generate checksum by parameters we have in body
         * Find your Merchant Key in your Paytm Dashboard at https://dashboard.paytm.com/next/apikeys
         */
        paytmChecksum = PaytmChecksum.generateSignature(body, "YOUR_MERCHANT_KEY");
        verifySignature = PaytmChecksum.verifySignature(body, "YOUR_MERCHANT_KEY", paytmChecksum);
        System.out.println("generateSignature Returns: " + paytmChecksum);
        System.out.println("verifySignature Returns: " + verifySignature);
    }
}
