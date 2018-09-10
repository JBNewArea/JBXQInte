package com.idea.modules.onlineRep.service.impl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.idea.core.common.service.impl.CommonServiceImpl;
import com.idea.modules.onlineRep.entity.XJLUser;
import com.idea.modules.onlineRep.mapper.XjlUserMapper;
import com.idea.modules.onlineRep.service.IXJLUserService;


@Transactional
@Service("xjluserservice")
public class XJLUserServiceImpl extends CommonServiceImpl<XjlUserMapper,XJLUser> implements  IXJLUserService{

	@Override
	public List<XJLUser> queryXjlUserList() {
		return  baseMapper.queryXjlUserList();
	}

}
