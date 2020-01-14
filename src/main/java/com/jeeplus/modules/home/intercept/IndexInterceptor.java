package com.jeeplus.modules.home.intercept;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateFormatUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.jeeplus.modules.portal.entity.Isystem;
import com.jeeplus.modules.portal.service.IsystemService;

public class IndexInterceptor implements HandlerInterceptor{

	@Autowired
	private IsystemService isystemService;
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String nowdayTime = dateFormat.format(new Date());
		Date nowDate = dateFormat.parse(nowdayTime);
		Isystem isystem = isystemService.getIsystem(nowDate);
		if(isystem!=null) {
			String count =isystem.getCount();
			isystem.setCount(String.valueOf((Long.parseLong(count)+1)));
			isystemService.save(isystem);
		}else {
			Isystem isystemNew =new Isystem();
			isystemNew.setName("吴忠人力资源服务产业园");
			isystemNew.setCount("1");
			isystemNew.setCreateDate(new Date());
			isystemService.save(isystemNew);
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

}
