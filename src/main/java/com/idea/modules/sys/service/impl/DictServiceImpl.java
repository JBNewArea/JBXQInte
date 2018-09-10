package com.idea.modules.sys.service.impl;

import com.idea.core.common.service.impl.CommonServiceImpl;
import com.idea.modules.sys.entity.Dict;
import com.idea.modules.sys.mapper.DictMapper;
import com.idea.modules.sys.service.IDictService;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service("dictService")
public class DictServiceImpl extends CommonServiceImpl<DictMapper, Dict> implements IDictService {

	@Override
	public List<Dict> selectDictList() {
		return baseMapper.selectDictList();
	}

}
