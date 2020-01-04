/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.portal.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.core.service.TreeService;
import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.modules.portal.entity.NewsModel;
import com.jeeplus.modules.portal.mapper.NewsModelMapper;

/**
 * 新闻模块管理Service
 * @author 李浩
 * @version 2019-05-21
 */
@Service
@Transactional(readOnly = true)
public class NewsModelService extends TreeService<NewsModelMapper, NewsModel> {

	public NewsModel get(String id) {
		return super.get(id);
	}
	
	public List<NewsModel> findList(NewsModel newsModel) {
		if (StringUtils.isNotBlank(newsModel.getParentIds())){
			newsModel.setParentIds(","+newsModel.getParentIds()+",");
		}
		return super.findList(newsModel);
	}
	
	@Transactional(readOnly = false)
	public void save(NewsModel newsModel) {
		super.save(newsModel);
	}
	
	@Transactional(readOnly = false)
	public void delete(NewsModel newsModel) {
		super.delete(newsModel);
	}
	
}