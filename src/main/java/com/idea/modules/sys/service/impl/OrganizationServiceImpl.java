package com.idea.modules.sys.service.impl;

import com.idea.core.common.service.impl.TreeCommonServiceImpl;
import com.idea.modules.sys.entity.Organization;
import com.idea.modules.sys.mapper.OrganizationMapper;
import com.idea.modules.sys.service.IOrganizationService;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Transactional
@Service("organizationService")
public class OrganizationServiceImpl extends TreeCommonServiceImpl<OrganizationMapper, Organization, String>
		implements IOrganizationService {

	@Override
	public List<Organization> findListByUserId(String userid) {
		return baseMapper.findListByUserId(userid);
	}

}
