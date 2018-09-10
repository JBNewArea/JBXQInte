package com.idea.modules.sys.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.idea.core.common.controller.BaseCRUDController;
import com.idea.core.security.shiro.authz.annotation.RequiresPathPermission;
import com.idea.modules.sys.entity.Log;

/**
 * 
 * All rights Reserved, Designed By change.cn
 * 
 * @title: 系统日志
 * @package com.idea.modules.sys.controller
 * @description: 系统日志
 * @author: 王存见
 * @date: 2017年5月29日 下午11:35:26
 * @version V1.0
 * @copyright: 2017 change.cn Inc. All rights reserved.
 *
 */
@Controller
@RequestMapping("${admin.url.prefix}/sys/log")
@RequiresPathPermission("sys:log")
public class LogController extends BaseCRUDController<Log, String> {

}
