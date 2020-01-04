/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.portal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.core.service.TreeService;
import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.modules.portal.entity.VideoModel;
import com.jeeplus.modules.portal.mapper.VideoModelMapper;

/**
 * 视频管理Service
 * @author 李浩
 * @version 2019-05-27
 */
@Service
@Transactional(readOnly = true)
public class VideoModelService extends TreeService<VideoModelMapper, VideoModel> {
	@Autowired
	VideoModelMapper videoModelMapper;
	
	public VideoModel get(String id) {
		return super.get(id);
	}
	
	public List<VideoModel> findList(VideoModel videoModel) {
		if (StringUtils.isNotBlank(videoModel.getParentIds())){
			videoModel.setParentIds(","+videoModel.getParentIds()+",");
		}
		return super.findList(videoModel);
	}
	
	public List<VideoModel> getVideoModel(VideoModel videoModel) {
		return videoModelMapper.getVideoModel(videoModel);
	}
	
	@Transactional(readOnly = false)
	public void save(VideoModel videoModel) {
		super.save(videoModel);
	}
	
	@Transactional(readOnly = false)
	public void delete(VideoModel videoModel) {
		super.delete(videoModel);
	}
	
}