package com.idea.modules.sys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.idea.core.common.controller.BaseTreeController;
import com.idea.core.security.shiro.authz.annotation.RequiresPathPermission;
import com.idea.modules.sys.entity.Menu;

@Controller
@RequestMapping("${admin.url.prefix}/sys/menu")
@RequiresPathPermission("sys:menu")
public class MenuController extends BaseTreeController<Menu, String> {

}
