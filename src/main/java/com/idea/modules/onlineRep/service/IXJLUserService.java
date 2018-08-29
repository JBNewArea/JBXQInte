package com.idea.modules.onlineRep.service;

import java.util.List;

import com.idea.core.common.service.ICommonService;
import com.idea.modules.onlineRep.entity.XJLUser;

public interface IXJLUserService extends ICommonService<XJLUser>{

	public List<XJLUser> queryXjlUserList();
}
