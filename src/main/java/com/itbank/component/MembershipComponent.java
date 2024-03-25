package com.itbank.component;

import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.itbank.model.MembershipDTO;

@Component
public class MembershipComponent {

    public static final String IMPORT_TOKEN_URL = "https://api.iamport.kr/users/getToken";
    public static final String IMPORT_CANCEL_URL = "https://api.iamport.kr/payments/cancel";
    
    public static final String KEY = "0008250545642717";
    public static final String SECRET = "Fi2FUv97REj2SuP8trkO557rVCllmrsvVesqhRW4va2HkrhCGcDA3k81egJ6B0yr7R2d0dxPcm4vsLA3";
    
    public static String getImportToken() throws URISyntaxException, IOException, InterruptedException {
           String result = "";
           HttpClient client = HttpClient.newHttpClient();
           HttpRequest.Builder requestBuilder = HttpRequest.newBuilder()
                   .uri(new URI(IMPORT_TOKEN_URL))
                   .header("Content-Type", "application/x-www-form-urlencoded");

           Map<String, String> m = new HashMap<>();
           m.put("imp_key", KEY);
           m.put("imp_secret", SECRET);

           StringBuilder bodyBuilder = new StringBuilder();
           for (Map.Entry<String, String> entry : m.entrySet()) {
               if (bodyBuilder.length() > 0) {
                   bodyBuilder.append("&");
               }
               bodyBuilder.append(entry.getKey()).append("=").append(entry.getValue());
           }

           HttpRequest request = requestBuilder.POST(HttpRequest.BodyPublishers.ofString(bodyBuilder.toString())).build();

           HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

           ObjectMapper mapper = new ObjectMapper();
           JsonNode rootNode = mapper.readTree(response.body());
           JsonNode resNode = rootNode.get("response");
           result = resNode.get("access_token").asText();

           System.out.println("#################################################### TOKEN :" + result);
           return result;
       }
    
    public int cancelPay(String token, MembershipDTO dto) throws URISyntaxException, IOException, InterruptedException {
        HttpClient client = HttpClient.newHttpClient();
        HttpRequest.Builder requestBuilder = HttpRequest.newBuilder()
                .uri(new URI(IMPORT_CANCEL_URL))
                .header("Authorization", token)
                .header("Content-Type", "application/x-www-form-urlencoded");

        Map<String, String> map = new HashMap<>();
        map.put("merchant_uid", dto.getPayNum());

        StringBuilder bodyBuilder = new StringBuilder();
        for (Map.Entry<String, String> entry : map.entrySet()) {
            if (bodyBuilder.length() > 0) {
                bodyBuilder.append("&");
            }
            bodyBuilder.append(entry.getKey()).append("=").append(entry.getValue());
        }

        HttpRequest request = requestBuilder.POST(HttpRequest.BodyPublishers.ofString(bodyBuilder.toString())).build();

        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

        ObjectMapper mapper = new ObjectMapper();
        JsonNode rootNode = mapper.readTree(response.body());
        String asd = rootNode.get("response").asText();

        if (asd.equals("null")) {
            System.err.println("환불실패");
            return -1;
        } else {
            System.err.println("환불성공");
            return 1;
        }
    }

       
   
}
