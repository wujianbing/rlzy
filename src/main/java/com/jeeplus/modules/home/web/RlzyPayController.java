package com.jeeplus.modules.home.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.SortedMap;

import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.Consts;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.jeeplus.modules.home.pay.alipay.AlipayConfig;
import com.jeeplus.modules.home.pay.wxpay.DOMParser;
import com.jeeplus.modules.home.pay.wxpay.HttpKit;
import com.jeeplus.modules.home.pay.wxpay.NativEntity;
import com.jeeplus.modules.home.pay.wxpay.WxConfig;
import com.jeeplus.modules.home.pay.wxpay.WxRequestUtil;
import com.jeeplus.modules.portal.entity.RlzyCompany;
import com.jeeplus.modules.portal.service.RlzyCompanyService;

@Controller
@RequestMapping("/pay")
public class RlzyPayController {
	
	@Autowired
	private RlzyCompanyService rlzyCompanyService;
	
	/**
	 * 选择支付方式
	 * @return
	 */
	@RequestMapping("/payMethod")
	public String payMethod(String companyId,Model model){
		model.addAttribute("companyId", companyId);
		return "modules/home/company/paymethod";
	}
	/**
	 * 支付宝支付表单
	 * @param companyId
	 * @param model
	 * @return
	 */
	@RequestMapping("/alipayform")
	public String alipayform(String companyId,Model model){
		model.addAttribute("companyId", companyId);
		return "modules/home/company/alipayform";
	}
	/**
	 * 微信支付接口
	 * @return
	 */
	
	@RequestMapping("/wxpay")
	public String wxPay(String companyId,Model model){
		NativEntity obj = new NativEntity();
		obj.setAppid(WxConfig.APPID);
		obj.setBody(WxConfig.body);
		obj.setMch_id(WxConfig.MCH_ID);
		obj.setNotify_url(WxConfig.notify_url);
		obj.setOut_trade_no(companyId);
		obj.setProduct_id(companyId);
		obj.setSpbill_create_ip(WxConfig.spbill_create_ip);
		obj.setTrade_type(WxConfig.TRADE_TYPE);
		obj.setTotal_fee(100);
		obj.sign();
		String parm = obj.makeXML();
		String result = HttpKit.post(WxConfig.URL, new String(parm.getBytes(), Consts.UTF_8));
		DOMParser domParser = new DOMParser();
		Map<String, String> data = domParser.makeData(result);
		String code_url = data.get("code_url");
		model.addAttribute("code_url",code_url);
		model.addAttribute("companyId", companyId);
		return "modules/home/company/paycode";
	}
	
	/**
	 * 微信支付回调地址
	 * @param request
	 * @param response
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@RequestMapping("notifyUrl")
	public String notifyUrl(HttpServletRequest request,HttpServletResponse response) throws IOException{
		System.out.println("已经支付完成了");
		Map<String, String> returnMap = new HashMap<String, String>();
		try {
			ServletInputStream inputStream = request.getInputStream();
			StringBuffer buffer = new StringBuffer();
			byte[] b = new byte[1024];
			int len = -1;
			while((len = inputStream.read(b)) != -1){
				buffer.append(new String(b,0,len));
			}
			inputStream.close();
			SortedMap<String, String> map = WxRequestUtil.doXMLParseWithSorted(buffer.toString());
			if("SUCCESS".equals(map.get("return_code"))){
//				String cargoId = map.get("out_trade_no"); 
//				cargoInfoService.updateStatus("1", cargoId);
				String companyId = map.get("out_trade_no");
				rlzyCompanyService.updatePayStatus(companyId,"0");
//				修改支付状态paystatus				
				returnMap.put("return_code", "SUCCESS");
				returnMap.put("return_msg", "OK");
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String result = WxRequestUtil.GetMapToXML(returnMap);
		//response.getWriter().write(result);
		//response.getWriter().flush();
		return result;
	}
	
	@RequestMapping("/qrcode")
	public String qrCode(){
		return "modules/home/qrcode";
	}
	@ResponseBody
	@RequestMapping("/alipay")
	public void aliPay(HttpServletRequest request,HttpServletResponse response,String companyId) throws Exception{
		//获得初始化的AlipayClient
		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id, AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key, AlipayConfig.sign_type);
		
		//设置请求参数
		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
		alipayRequest.setReturnUrl(AlipayConfig.return_url);
		alipayRequest.setNotifyUrl(AlipayConfig.notify_url);
		
		//商户订单号，商户网站订单系统中唯一订单号，必填
		String out_trade_no = request.getParameter("WIDout_trade_no");
		//付款金额，必填
		String total_amount = request.getParameter("WIDtotal_amount");
		//订单名称，必填
		String subject = request.getParameter("WIDsubject");
		//商品描述，可空
		String body = request.getParameter("WIDbody");
		
		//若想给BizContent增加其他可选请求参数，以增加自定义超时时间参数timeout_express来举例说明
		alipayRequest.setBizContent("{\"out_trade_no\":\""+ out_trade_no +"\"," 
				+ "\"total_amount\":\""+ total_amount +"\"," 
				+ "\"subject\":\""+ subject +"\"," 
				+ "\"body\":\""+ body +"\"," 
				+ "\"timeout_express\":\"10m\"," 
				+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
		 String form="";
		    try {
		        form = alipayClient.pageExecute(alipayRequest).getBody(); //调用SDK生成表单
		    } catch (AlipayApiException e) {
		        e.printStackTrace();
		    }
		    response.setContentType("text/html;charset="+AlipayConfig.charset);
		    response.getWriter().write(form);//直接将完整的表单html输出到页面
		    response.getWriter().flush();
		    response.getWriter().close();
		}
		

	@ResponseBody
	@RequestMapping("/aliNotify")
	public String aliNotify(HttpServletRequest request,HttpServletResponse response) throws Exception{
		//获取支付宝POST过来反馈信息
		Map<String,String> params = new HashMap<String,String>();
		Map<String,String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i]
						: valueStr + values[i] + ",";
			}
			//乱码解决，这段代码在出现乱码时使用
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		
		boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset, AlipayConfig.sign_type); //调用SDK验证签名
		//boolean signVerified=false;
		//——请在这里编写您的程序（以下代码仅作参考）——
		
		/* 实际验证过程建议商户务必添加以下校验：
		1、需要验证该通知数据中的out_trade_no是否为商户系统中创建的订单号，
		2、判断total_amount是否确实为该订单的实际金额（即商户订单创建时的金额），
		3、校验通知中的seller_id（或者seller_email) 是否为out_trade_no这笔单据的对应的操作方（有的时候，一个商户可能有多个seller_id/seller_email）
		4、验证app_id是否为该商户本身。
		*/
		PrintWriter out = response.getWriter();
		if(signVerified) {//验证成功
			//商户订单号
			String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"),"UTF-8");
		
			//支付宝交易号
			String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"),"UTF-8");
		
			//交易状态
			String trade_status = new String(request.getParameter("trade_status").getBytes("ISO-8859-1"),"UTF-8");
			
			if(trade_status.equals("TRADE_FINISHED")){
				//判断该笔订单是否在商户网站中已经做过处理
				//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				//如果有做过处理，不执行商户的业务程序
				rlzyCompanyService.updatePayStatus(out_trade_no,"0");	
				//注意：
				//退款日期超过可退款期限后（如三个月可退款），支付宝系统发送该交易状态通知
			}else if (trade_status.equals("TRADE_SUCCESS")){
				//判断该笔订单是否在商户网站中已经做过处理
				//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
				//如果有做过处理，不执行商户的业务程序
				
				//注意：
				//付款完成后，支付宝系统发送该交易状态通知
			}
			
			out.println("success");
			
		}else {//验证失败
			out.println("fail");
		
			//调试用，写文本函数记录程序运行情况是否正常
			//String sWord = AlipaySignature.getSignCheckContentV1(params);
			//AlipayConfig.logResult(sWord);
		}
		return "";
	}
	/**
	 * 支付成功跳转
	 * @return
	 */
	@RequestMapping("/paysuccess")
	public String paySuccess(){
		return "modules/home/company/paysuccess";
	}
	/**
	 * 微信查询后台支付状态
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/affrimPay")
	public String affrimPay(String companyId){
		RlzyCompany company = rlzyCompanyService.get(companyId);
		String payStatus = company.getPaystatus();
		if("0".equals(payStatus)){//完成支付
			return "1";
		}
		//未完成支付
		return "2";
	}
}
