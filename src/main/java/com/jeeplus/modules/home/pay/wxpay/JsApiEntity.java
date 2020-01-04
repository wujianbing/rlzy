package com.jeeplus.modules.home.pay.wxpay;

import io.swagger.annotations.ApiModel;

@ApiModel(value="JsApiEntity",discriminator="wu",subTypes={JsApiEntity.class})
public class JsApiEntity {
	
	private String appid;
	private String mch_id;
	private String nonce_str;
	private String sign;
	private String body;
	private String out_trade_no;
	private int total_fee;
	private String spbill_create_ip;
	private String notify_url;
	private String trade_type;
	private String openid;
	public String toString(){
		StringBuffer builder = new StringBuffer();
		builder.append("appid=");
		builder.append(appid);
		
		builder.append("&body=");
		builder.append(body);
		
		builder.append("&mch_id=");
		builder.append(mch_id);
		
		builder.append("&nonce_str=");
		builder.append(nonce_str);
		
		builder.append("&notify_url=");
		builder.append(notify_url);
		
		builder.append("&openid=");
		builder.append(openid);
		
		builder.append("&out_trade_no=");
		builder.append(out_trade_no);
		
		builder.append("&spbill_create_ip=");
		builder.append(spbill_create_ip);
		
		builder.append("&total_fee=");
		builder.append(total_fee);
		
		builder.append("&trade_type=");
		builder.append(trade_type);
		
		
		return builder.toString();
	}
	
	public String makeXml(){
		StringBuffer builder = new StringBuffer();
		builder.append("<xml><appid><![CDATA[");
		builder.append(appid);
		builder.append("]]></appid><mch_id><![CDATA[");
		builder.append(mch_id);
		builder.append("]]></mch_id><body><![CDATA[");
		builder.append(body);
		builder.append("]]></body><nonce_str><![CDATA[");
		builder.append(nonce_str);
		builder.append("]]></nonce_str><notify_url><![CDATA[");
		builder.append(notify_url);
		builder.append("]]></notify_url><out_trade_no><![CDATA[");
		builder.append(out_trade_no);
		builder.append("]]></out_trade_no><spbill_create_ip><![CDATA[");
		builder.append(spbill_create_ip);
		builder.append("]]></spbill_create_ip><openid><![CDATA[");
		builder.append(openid);
		builder.append("]]></openid><total_fee><![CDATA[");
		builder.append(total_fee);
		builder.append("]]></total_fee><trade_type><![CDATA[");
		builder.append(trade_type);
		builder.append("]]></trade_type><sign><![CDATA[");
		builder.append(sign);
		builder.append("]]></sign>");
		builder.append("</xml>");
		return builder.toString();
	}
	
	public void sign(){
		nonce_str="123456";
		String signValue = toString()+"&key="+WxConfig.KEY;
		this.sign = BaseUtil.md5(signValue).toUpperCase();
	}
	
	public String getAppid() {
		return appid;
	}
	public void setAppid(String appid) {
		this.appid = appid;
	}
	public String getMch_id() {
		return mch_id;
	}
	public void setMch_id(String mch_id) {
		this.mch_id = mch_id;
	}
	public String getNonce_str() {
		return nonce_str;
	}
	public void setNonce_str(String nonce_str) {
		this.nonce_str = nonce_str;
	}
	public String getSign() {
		return sign;
	}
	public void setSign(String sign) {
		this.sign = sign;
	}
	public String getBody() {
		return body;
	}
	public void setBody(String body) {
		this.body = body;
	}
	public String getOut_trade_no() {
		return out_trade_no;
	}
	public void setOut_trade_no(String out_trade_no) {
		this.out_trade_no = out_trade_no;
	}
	public int getTotal_fee() {
		return total_fee;
	}
	public void setTotal_fee(int total_fee) {
		this.total_fee = total_fee;
	}
	public String getSpbill_create_ip() {
		return spbill_create_ip;
	}
	public void setSpbill_create_ip(String spbill_create_ip) {
		this.spbill_create_ip = spbill_create_ip;
	}
	public String getNotify_url() {
		return notify_url;
	}
	public void setNotify_url(String notify_url) {
		this.notify_url = notify_url;
	}
	public String getTrade_type() {
		return trade_type;
	}
	public void setTrade_type(String trade_type) {
		this.trade_type = trade_type;
	}

	public String getOpenid() {
		return openid;
	}

	public void setOpenid(String openid) {
		this.openid = openid;
	}
	 
}
