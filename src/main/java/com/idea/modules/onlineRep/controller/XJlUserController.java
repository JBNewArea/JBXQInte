package com.idea.modules.onlineRep.controller;
import java.net.MalformedURLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.idea.core.common.controller.BaseCRUDController;
import com.idea.core.model.AjaxJson;
import com.idea.core.security.shiro.authz.annotation.RequiresPathPermission;
import com.idea.modules.onlineRep.entity.XJLUser;
import com.idea.modules.onlineRep.service.IXJLUserService;
import com.idea.modules.onlineRep.utils.OnlineUtils;

@Controller
@RequestMapping("${admin.url.prefix}/xjlu")
@RequiresPathPermission("on:onlinerep")
public class XJlUserController extends BaseCRUDController<XJLUser, String>{

	@Autowired
	private IXJLUserService xjlUserService;
	
	
	/**
	 * 异步调用 - 注册
	 * @param request
	 * @param response
	 */
	@ResponseBody
	@RequestMapping(value = "/doRegister", method = RequestMethod.POST)
	public void queryUserList(HttpServletRequest request, HttpServletResponse response){
		String loginName = request.getParameter("loginName");
		String pwd = request.getParameter("plainPassword");
		String tel = request.getParameter("telphone");
		String code = request.getParameter("code");
	}
	
	
	/**
	 * 异步调用 - 短信验证码
	 * @param request
	 * @param response
	 * @return
	 * @throws MalformedURLException
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "/regVefyCode", method = RequestMethod.POST)
	public AjaxJson verifyCode(HttpServletRequest request, HttpServletResponse response) throws MalformedURLException, Exception{
		AjaxJson ajaxJson = new AjaxJson();
		String phone = request.getParameter("phone");
		String num = OnlineUtils.getSixRandom();
		ajaxJson.setData(OnlineUtils.xfireClient(phone, num));
		return ajaxJson;
	}
}
