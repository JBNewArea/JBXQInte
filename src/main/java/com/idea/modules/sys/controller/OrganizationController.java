package com.idea.modules.sys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.idea.core.common.controller.BaseTreeController;
import com.idea.core.security.shiro.authz.annotation.RequiresPathPermission;
import com.idea.modules.sys.entity.Organization;

@Controller
@RequestMapping("${admin.url.prefix}/sys/organization")
@RequiresPathPermission("sys:organization")
public class OrganizationController extends BaseTreeController<Organization, String> {
	
}
