package com.jeeplus.modules.home.pay.wxpay;

/**
 * @author 
 * @description 
 *	时间:2015年11月11日下午8:07:35
 */
import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilderFactory;

import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;






public class DOMParser { 
	public static Logger LOGGER = LoggerFactory.getLogger(DOMParser.class);
	DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance(); 
	//Load and parse XML file into DOM 
	public Document parse(String xml) {
		LOGGER.info("xml={}",xml);
		Document document = null; 
		try { 
			SAXReader saxReader = new SAXReader();
			
			InputStream in = new ByteArrayInputStream(xml.getBytes("utf-8"));
			LOGGER.info("in={}",in);
			 document = saxReader.read(in);
			 LOGGER.info("document","通过");
		} catch (Exception e) { 
			e.printStackTrace(); 
		} 
		return document; 
	}
	

	public Document parse(InputStream in) { 
		Document document = null; 
		try { 
			SAXReader saxReader = new SAXReader();
			
			 document = saxReader.read(in);
		} catch (Exception e) { 
			e.printStackTrace(); 
		} 
		return document; 
	}
	
	
	public Map<String, String> makeData(String xml){
		DOMParser domParser = new DOMParser();
		Document document =  domParser.parse(xml);
		Element root = document.getRootElement();
		
		System.out.println("root:"+root.getName());
		
		Map<String, String> data = new HashMap<String, String>();
		
		List<Element> childList = root.elements();
		for(Element child : childList){
			String value = (String) child.getData();
			String name = child.getName();
			if(name.equals("return_code")){
				data.put("return_code",value);
			}else if(name.equals("return_msg")){
				data.put("return_msg",value);
			}else if(name.equals("appid")){
				data.put("appid",value);
			}else if(name.equals("mch_id")){
				data.put("mch_id",value);
			}else if(name.equals("nonce_str")){
				data.put("nonce_str",value);
			}else if(name.equals("sign")){
				data.put("sign",value);
			}else if(name.equals("result_code")){
				data.put("result_code",value);
			}else if(name.equals("prepay_id")){
				data.put("prepay_id",value);
			}else if(name.equals("trade_type")){
				data.put("trade_type",value);
			}else if(name.equals("code_url")){
				data.put("code_url",value);
			}
			//jdk 1.7
//			switch (child.getName()) {
//			case "return_code":
//				data.setAppid(value);
//				break;
//			case "return_msg":
//				data.setReturn_msg(value);
//				break;
//			case "appid":
//				data.setAppid(value);
//				break;
//			case "mch_id":
//				data.setMch_id(value);
//				break;
//			case "nonce_str":
//				data.setNonce_str(value);
//				break;
//			case "sign":
//				data.setSign(value);
//				break;
//			case "result_code":
//				data.setResult_code(value);
//				break;
//			case "prepay_id":
//				data.setPrepay_id(value);
//				break;
//			case "trade_type":
//				data.setTrade_type(value);
//				break;
//			case "code_url":
//				data.setCode_url(value);
//				break;
//			default:
//				break;
//			}
		}
		return data;
	}
	
	/**
	 * 微信退款返回xml解析
	 * @param xml
	 * @return
	 */
//	public WxRefundData getData(String xml){
//		LOGGER.info("xml={}",xml);
//		DOMParser domParser = new DOMParser();
//		Document document =  domParser.parse(xml);
//		LOGGER.info("document={}",document.getRootElement());
//		Element root = document.getRootElement();
//		LOGGER.info("name={}",root.getName());
//		System.out.println("root:"+root.getName());
//		
//		WxRefundData data = new WxRefundData();
//		
//		List<Element> childList = root.elements();
//		for(Element child : childList){
//			String value = (String) child.getData();
//			String name = child.getName();
//			if(name.equals("return_code")){
//				data.setReturn_code(value);
//			}else if(name.equals("return_msg")){
//				data.setReturn_msg(value);
//			}/*else if(name.equals("appid")){
//				data.setAppid(value);
//			}else if(name.equals("mch_id")){
//				data.setMch_id(value);
//			}else if(name.equals("nonce_str")){
//				data.setNonce_str(value);
//			}else if(name.equals("sign")){
//				data.setSign(value);
//			}else if(name.equals("result_code")){
//				data.setResult_code(value);
//			}else if(name.equals("prepay_id")){
//				data.setPrepay_id(value);
//			}else if(name.equals("trade_type")){
//				data.setTrade_type(value);
//			}else if(name.equals("code_url")){
//				data.setCode_url(value);
//			}*/
//			//jdk 1.7
//			switch (child.getName()) {
//			case "return_code":
//				data.setAppid(value);
//				break;
//			case "return_msg":
//				data.setReturn_msg(value);
//				break;
//			case "appid":
//				data.setAppid(value);
//				break;
//			case "mch_id":
//				data.setMch_id(value);
//				break;
//			case "nonce_str":
//				data.setNonce_str(value);
//				break;
//			case "sign":
//				data.setSign(value);
//				break;
//			case "result_code":
//				data.setResult_code(value);
//				break;
//			case "prepay_id":
//				data.setPrepay_id(value);
//				break;
//			case "trade_type":
//				data.setTrade_type(value);
//				break;
//			case "code_url":
//				data.setCode_url(value);
//				break;
//			default:
//				break;
//			}
//		}
//		return data;
//	}
	
	
	//<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[签名错误]]></return_msg>
	public static void main(String[] args) {
		String xml = "<xml><return_code><![CDATA[FAIL]]></return_code><return_msg><![CDATA[签名错误]]></return_msg></xml>";
		/*String xml =  "<xml> "+
				"  <return_code><![CDATA[SUCCESS]]></return_code> "+
				" <return_msg><![CDATA[无法链接服务器]]></return_msg> "+
				"</xml>";*/
//		
//		DOMParser d = new DOMParser();
//		WxReturnData data =  d.makeData(xml);
//		System.out.println(data);
	} 
}