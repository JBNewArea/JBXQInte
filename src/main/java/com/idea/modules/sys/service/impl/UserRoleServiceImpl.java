package com.idea.modules.sys.service.impl;

import com.idea.core.common.service.impl.CommonServiceImpl;
import com.idea.modules.sys.entity.UserRole;
import com.idea.modules.sys.mapper.UserRoleMapper;
import com.idea.modules.sys.service.IUserRoleService;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service("userRoleService")
public class UserRoleServiceImpl extends CommonServiceImpl<UserRoleMapper,UserRole> implements IUserRoleService {

}
