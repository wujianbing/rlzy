package com.jeeplus.modules.api;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLConnection;

public class Utils {

	private static final String APPID = "wx70ef34a5fb207287";

	private static final String SECRET = "01d689cafe0092193eed74b936e0f871";

	public static String getOpenId(String code) {
		BufferedReader in = null;
		final String url = "https://api.weixin.qq.com/sns/jscode2session?appid=" + APPID + "&secret=" + SECRET
				+ "&js_code=" + code + "&grant_type=authorization_code";
		try {
			URL wUrl = new URL(url);
			URLConnection connection = wUrl.openConnection();
			connection.setConnectTimeout(5000);
			connection.setReadTimeout(5000);
			connection.connect();
			in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
			StringBuffer sb = new StringBuffer();
			String line;
			while ((line = in.readLine()) != null) {
				sb.append(line);
			}
			return sb.toString();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (in != null) {
					in.close();
				}
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return null;
	}
   
}
