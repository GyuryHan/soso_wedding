package kr.co.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Collection;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class KakaoServiceImpl {
	private String client_id = "50a9be3a49b8a6fa37a35fdad85aae49"; // 내 앱의 REST API key
	
	public JsonNode getAccessToken(String authorize_code) {
		System.out.println("kakaoServiceImpl-start");
		System.out.println("getAccessToken");
		final String RequestUrl = "https://kauth.kakao.com/oauth/token";
		String access_token = "";
		String refresh_token = "";

		final Collection<NameValuePair> postParams = new ArrayList<NameValuePair>();

		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
		postParams.add(new BasicNameValuePair("client_id", client_id));
		postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:10001/oauth"));
		postParams.add(new BasicNameValuePair("code", authorize_code));

		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);

		JsonNode returnNode = null;

		try {
			post.setEntity(new UrlEncodedFormEntity(postParams));
			final HttpResponse response = client.execute(post);

			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());

			access_token = returnNode.get("access_token").toString();
			refresh_token = returnNode.get("refresh_token").toString();
			System.out.print("returnNode 값" + returnNode);
			System.out.println("access_token = " + access_token);
			System.out.println("refresh_token = " + refresh_token);
			System.out.println("kakaoserviceimpl-end");

		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {

		}
		return returnNode;
	}

	// 받아온 access_Token 을 이용해서 사용자 정보를 받아오는 부분
	public JsonNode getUserInfo(JsonNode access_token) {
		System.out.println("getUserInfo-start");
		final String RequestUrl = "https://kapi.kakao.com/v2/user/me";

		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);

		JsonNode resultNode = null;
		post.addHeader("Authorization", "Bearer " + access_token);

		try {
			final HttpResponse response = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();

			System.out.println("response.getEntity() : " + response.getEntity());
			System.out.println("response.getEntity().getContent() : " + response.getEntity().getContent());

			resultNode = mapper.readTree(response.getEntity().getContent());

			System.out.println("resultNode : " + resultNode);
			System.out.println("getUserInfo-end");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {

		}
		return resultNode;
	}

}

