package com.idea.modules.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.idea.core.common.controller.BaseController;

/**
 * 
 * All rights Reserved, Designed By change.cn
 * 
 * @title: FormDemoController.java
 * @package com.idea.modules.demo.controller
 * @description: 统计报表DEMO
 * @author: 王存见
 * @date: 2017年5月18日 下午6:17:24
 * @version V1.0
 * @copyright: 2017 change.cn Inc. All rights reserved.
 *
 */

@Controller
@RequestMapping("${admin.url.prefix}/demo/echart")
public class EchartDemoController extends BaseController {

	/**
	 * 
	 * @title: echart   
	 * @description: 统计 
	 * @return      
	 * @return: String
	 */
	@RequestMapping("/index")
	public String echart() {
		return display("index");
	}
 
}
