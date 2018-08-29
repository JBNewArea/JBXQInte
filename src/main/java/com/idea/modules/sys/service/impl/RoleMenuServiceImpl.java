package com.idea.modules.sys.service.impl;

import com.idea.core.common.service.impl.CommonServiceImpl;
import com.idea.modules.sys.entity.RoleMenu;
import com.idea.modules.sys.mapper.RoleMenuMapper;
import com.idea.modules.sys.service.IRoleMenuService;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service("roleMenuService")
public class RoleMenuServiceImpl extends CommonServiceImpl<RoleMenuMapper,RoleMenu> implements IRoleMenuService {

}
