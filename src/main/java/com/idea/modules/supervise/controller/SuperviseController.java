package com.idea.modules.supervise.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.idea.core.common.controller.BaseCRUDController;
import com.idea.core.common.controller.BaseController;
import com.idea.core.security.shiro.authz.annotation.RequiresMethodPermissions;
import com.idea.core.security.shiro.authz.annotation.RequiresPathPermission;
import com.idea.modules.supervise.entity.Supervise;
import com.idea.modules.supervise.service.ISuperviseService;

@Controller
@RequestMapping("${admin.url.prefix}/supervise")
@RequiresPathPermission("su:supervise")
public class SuperviseController extends BaseCRUDController<Supervise,String> {

	@RequestMapping("/index")
	public String toIndex(Model model, HttpServletRequest request, HttpServletResponse response){
		return display("index");
	}
	
	@RequestMapping("/view")
	public String toCommonProblem(Model model, HttpServletRequest request, HttpServletResponse response){
		return display("view");
	}
	
	
	@RequestMapping("/contact")
	public String toContact(Model model, HttpServletRequest request, HttpServletResponse response){
		return display("contact");
	}
	
	@RequestMapping("/toAudit")
	public String toAudit(Model model, HttpServletRequest request, HttpServletResponse response){
		return display("/audit/list");
	}
	
}
