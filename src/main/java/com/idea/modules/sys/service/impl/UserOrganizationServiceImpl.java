package com.idea.modules.sys.service.impl;

import com.idea.core.common.service.impl.CommonServiceImpl;
import com.idea.modules.sys.entity.UserOrganization;
import com.idea.modules.sys.mapper.UserOrganizationMapper;
import com.idea.modules.sys.service.IUserOrganizationService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


@Transactional
@Service("userOrganizationService")
public class UserOrganizationServiceImpl extends CommonServiceImpl<UserOrganizationMapper, UserOrganization>
		implements IUserOrganizationService {

}
