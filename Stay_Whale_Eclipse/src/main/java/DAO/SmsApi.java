package DAO;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Base64;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

public class SmsApi {
	private static final String ACCESS_KEY = "MoYnVLcrEbU71n0orEJ5";
    private static final String SECRET_KEY = "ejPTlicA3rsHzpvEaqNgT1B9ZyRtDMLArhBhU1wL";
    private static final String API_URL = "https://sens.apigw.ntruss.com/sms/v2/services/ncp:sms:kr:305605554092:sms-test/messages";

    public String numbersend(String phoneNumber) throws Exception {
        //String phoneNumber = "01027469975";
        String testnumber = "" + (int)(Math.random()*10) + (int)(Math.random()*10) + (int)(Math.random()*10) + (int)(Math.random()*10) + (int)(Math.random()*10) + (int)(Math.random()*10);
        String message = "인증번호["+ testnumber +"]를 입력해주세요.";
        String timestamp = Long.toString(System.currentTimeMillis());
        String space = " ";
        String newLine = "\n";
        String method = "POST";
        String url = "/sms/v2/services/ncp:sms:kr:305605554092:sms-test/messages";
        String messageToSign = new StringBuilder()
                .append(method).append(space)
                .append(url).append(newLine)
                .append(timestamp).append(newLine)
                .append(ACCESS_KEY)
                .toString();
        
        SecretKeySpec signingKey = new SecretKeySpec(SECRET_KEY.getBytes("UTF-8"), "HmacSHA256");
        Mac mac = Mac.getInstance("HmacSHA256");
        mac.init(signingKey);

        byte[] rawHmac = mac.doFinal(messageToSign.getBytes("UTF-8"));
        String signature = Base64.getEncoder().encodeToString(rawHmac);
        
        String body = new StringBuilder()
                .append("{")
                .append("\"type\":\"SMS\",")
                .append("\"contentType\":\"COMM\",")
                .append("\"countryCode\":\"82\",")
                .append("\"from\":\"01027469975\",")
                .append("\"content\":\"").append(message).append("\",")
                .append("\"messages\":[{\"to\":\"").append(phoneNumber).append("\"}]")
                .append("}")
                .toString();
        
        URL url1 = new URL(API_URL);
        HttpURLConnection conn = (HttpURLConnection) url1.openConnection();
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
        conn.setRequestProperty("x-ncp-apigw-timestamp", timestamp);
        conn.setRequestProperty("x-ncp-iam-access-key", ACCESS_KEY);
        conn.setRequestProperty("x-ncp-apigw-signature-v2", signature);
        conn.setDoOutput(true);

        OutputStream os = conn.getOutputStream();
        os.write(body.getBytes("UTF-8"));
        os.flush();
        os.close();

        int responseCode = conn.getResponseCode();
        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        String inputLine;
        StringBuffer response = new StringBuffer();
        while ((inputLine = in.readLine()) != null) {
            response.append(inputLine);
        }
        in.close();

        if (responseCode == 202) {
            System.out.println("SMS 전송에 성공했습니다.");
            System.out.println(response.toString());
        } else {
            System.out.println("SMS 전송에 실패했습니다.");
            System.out.println("responseCode: " + responseCode);
        }
		return testnumber.trim();
    }
}
