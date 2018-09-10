package com.idea.modules.sys.mapper;

import java.util.List;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.idea.modules.sys.entity.Dict;

public interface DictMapper extends BaseMapper<Dict> {
	List<Dict> selectDictList();
}