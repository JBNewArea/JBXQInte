package com.idea.modules.supervise.mapper;

import java.util.List;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.idea.modules.supervise.entity.Supervise;

public interface SuperviseMapper extends BaseMapper<Supervise> {

	
	List<Supervise> querySupervisepage();
}
