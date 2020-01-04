package com.jeeplus.modules.api;

import java.util.HashMap;
import java.util.Map;

import org.apache.http.Consts;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jeeplus.modules.home.pay.wxpay.BaseUtil;
import com.jeeplus.modules.home.pay.wxpay.DOMParser;
import com.jeeplus.modules.home.pay.wxpay.HttpKit;
import com.jeeplus.modules.home.pay.wxpay.JsApiEntity;
import com.jeeplus.modules.home.pay.wxpay.WxConfig;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;
import net.sf.json.JSONObject;
@Api(value="小程序支付controller")
@Controller
@RequestMapping("/api/pay")
public class ApiPayController {
	//支付类型 小程序支付
	private static final String trade_type = "JSAPI";
	
	/**
	 * 获取oppenid
	 * @param code
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/getopenid",method=RequestMethod.GET)
	@ApiOperation(value="openid",notes="获取openid")
	public ReturnJson getOpenid(@ApiParam(name="code",value="String",required=true)@RequestParam("code")String code){
		System.out.println("code="+code);
		ReturnJson returnJson = new ReturnJson(); 
		String opnen_url = WxConfig.OPENDID_URL.replace("{APPID}", WxConfig.APPLET_appid).replace("{SECRET}", WxConfig.APPLET_AppSecret).replace("{JSCODE}", code);
		String result = HttpKit.get(opnen_url);
		JSONObject authResult = JSONObject.fromObject(result);
		String oppenid = (String)authResult.get("openid");
		Map<String,Object> map = new HashMap<>();
		map.put("openid", oppenid);
		returnJson.setCode("200");
		returnJson.setStatus(true);
		returnJson.setResult(map);
		returnJson.setMessage("成功");
		return returnJson;
	}
	
	/**
	 * 统一下单支付
	 * @param openid
	 * @param companyId
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/jsapipay",method=RequestMethod.GET)
	@ApiOperation(value="支付",notes="返回支付所需参数")
	public ReturnJson jsapiPay(@ApiParam(name="openid",value="String",required=true)@RequestParam("openid")String openid,@ApiParam(name="companyId",value="String",required=true)@RequestParam("companyId")String companyId){
		ReturnJson returnJson = new ReturnJson();
		Map<String,Object> map = new HashMap<>();
		JsApiEntity entity = new JsApiEntity();
		entity.setAppid(WxConfig.APPLET_appid);
		entity.setMch_id(WxConfig.MCH_ID);
		entity.setBody(WxConfig.body);
		entity.setOut_trade_no(companyId);
		entity.setTotal_fee(100);
		entity.setSpbill_create_ip(WxConfig.spbill_create_ip);
		entity.setNotify_url(WxConfig.notify_url);
		entity.setTrade_type(trade_type);
		entity.setOpenid(openid);
		entity.sign();
		String parm = entity.makeXml();
		String result = HttpKit.post(WxConfig.URL, new String(parm.getBytes(), Consts.UTF_8));
		DOMParser domParser = new DOMParser();
		Map<String, String> data = domParser.makeData(result);
		String prepay_id = data.get("prepay_id");
		String timeStamp = String.valueOf(System.currentTimeMillis()/1000);
		StringBuffer buffer = new StringBuffer();
		buffer.append("appId=");
		buffer.append(WxConfig.APPLET_appid);
		buffer.append("&nonceStr=123456");
		buffer.append("&package=prepay_id=");
		buffer.append(prepay_id);
		buffer.append("&signType=MD5");
		buffer.append("&timeStamp=");
		buffer.append(timeStamp);
		
		String payValue =buffer.toString()+"&key="+WxConfig.KEY;
        String paySign = BaseUtil.md5(payValue).toUpperCase();
        map.put("timeStamp", timeStamp);
        map.put("nonceStr", "123456");
        map.put("package", "prepay_id="+prepay_id);
        map.put("signType", "MD5");
        map.put("paySign", paySign);
        returnJson.setCode("200");
		returnJson.setStatus(true);
		returnJson.setResult(map);
		returnJson.setMessage("成功");
		return returnJson;
	}
}
