package com.idea.modules.onlineRep.controller;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import com.idea.core.common.controller.BaseController;
import com.idea.core.model.AjaxJson;
import com.idea.core.security.shiro.authz.annotation.RequiresPathPermission;
import com.idea.core.utils.http.HttpRequest;
import com.idea.modules.onlineRep.utils.OnlineUtils;

@Controller
@RequestMapping("${admin.url.prefix}/onlinerep")
@RequiresPathPermission("on:onlinerep")
public class OnlineController extends BaseController {

	
	/**
	 * 跳转 - 主页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/index")
	public String toIndex(HttpServletRequest request, HttpServletResponse response){
		return display("index");
	}
	
	/**
	 * 跳转 - 事项页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/matter")
	public String toMatter(HttpServletRequest request, HttpServletResponse response){
		return display("matter");
	}
	
	/**
	 * 跳转 - 主题事项
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/themeMatter")
	public String toThemeMatter(HttpServletRequest request, HttpServletResponse response){
		return display("themeMatter");
	}
	
	/**
	 * 跳转 - 在线登录
	 * @return
	 */
	@RequestMapping("/tolineLogin")
	public String toOnlineLogin(){
		return display("login");
	}
	
	/**
	 * 跳转 - 注册页
	 * @return
	 */
	@RequestMapping("/toRegister")
	public String toRegister(){
		return display("register");
	}
	
	/**
	 * 跳转 - 申报页面
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/toDeclare")
	public String toDeclare(HttpServletRequest request, HttpServletResponse response){
		request.setAttribute("type", request.getParameter("type"));
		return display("declare");
	}
	
	/**
	 * 跳转 - 地图服务
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/toMap")
	public String toMap(HttpServletRequest request, HttpServletResponse response){
		return display("map");
	}
	
	
	/**
	 * 跳转 - 办事指南
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/toMatterGuide")
	public String toMatterGuide(HttpServletRequest request, HttpServletResponse response){
		request.setAttribute("id",request.getParameter("id"));
		return display("matterGuide");
	}
	
	/**
	 * 跳转 - 个人中心
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/toPerCenter")
	public String toPerCenter(HttpServletRequest request, HttpServletResponse response){
		return display("perCenter");
	}
	/**
	 * 创建 - 验证码
	 * @param request
	 * @param response
	 */
	@RequestMapping("/createImg")
	public void createValidCode(HttpServletRequest request, HttpServletResponse response){
		try {
			OnlineUtils.createImage(request, response);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 模拟 - 登录跳转
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/toOnlineDeclare", method = RequestMethod.POST)
	public AjaxJson toOnlineDeclare(HttpServletRequest request, HttpServletResponse response){
		 String res = "{\"type\":\"1\",\"id\":\"af1267c315ca4729aafcb12f9c65fecd\",\"loginname\":\"gabrain\"}";
	     AjaxJson ajaxJson = new AjaxJson();
	     ajaxJson.setData(res);
		 return ajaxJson;
	}
	/**
	 * 异步请求 - 调用事项接口
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getMatter", method = RequestMethod.POST)
	public  AjaxJson getMattetList(HttpServletRequest request, HttpServletResponse response){
		AjaxJson ajaxJson = new AjaxJson();
		String pageNo =  request.getParameter("pageNo");
		String pageSize = request.getParameter("pageSize");
		String transName = request.getParameter("transName");
		String params = "pageNo="+pageNo+"&pageSize="+pageSize+"&transName="+transName;
		try {
			String res = HttpRequest.sendPost(OnlineUtils.INTERFACEURL+OnlineUtils.ONLINE_MATTER_URL,params);
			ajaxJson.setData(res);
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		return ajaxJson;
	}
	
	
	/**
	 * 异步请求 - 接口调用
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getTrans", method = RequestMethod.POST)
	public AjaxJson getTrans(HttpServletRequest request, HttpServletResponse response){
		AjaxJson ajaxJson = new AjaxJson();
		String id =  request.getParameter("id");
		String params = "id="+id;
		try {
			String res = HttpRequest.sendPost(OnlineUtils.INTERFACEURL+OnlineUtils.ONLINE_TRANS_URL,params);
			ajaxJson.setData(res);
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		return ajaxJson;
	}
	
	/**
	 * 异步调用 - 事项对应材料接口
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getMaterial", method = RequestMethod.POST)
	public AjaxJson getMaterial(HttpServletRequest request, HttpServletResponse response){
		AjaxJson ajaxJson = new AjaxJson();
		String ids = request.getParameter("ids");
		String params = "ids="+ids;
		try {
			String res = HttpRequest.sendPost(OnlineUtils.INTERFACEURL+OnlineUtils.ONLIEN_MATERIAL_URL, params);
			ajaxJson.setData(res);
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		return ajaxJson;
	}
	
	/**
	 * 异步调用 - 通过身份证查询办件
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getListApplicationByIdCard", method = RequestMethod.POST)
	public AjaxJson getListApplicationByIdCard(HttpServletRequest request, HttpServletResponse response){
		AjaxJson ajaxJson = new AjaxJson();
		String applicantDocumentNumber = request.getParameter("applicantDocumentNumber");
		String status = request.getParameter("status");
		String transName = request.getParameter("transName");
		String applicantDocumentType =  request.getParameter("applicantDocumentType");
		String params = "applicantDocumentNumber="+applicantDocumentNumber+"&status="+status+"&transName="+transName+"&applicantDocumentType="+applicantDocumentType;
		try {
			String res = HttpRequest.sendPost(OnlineUtils.INTERFACEURL+OnlineUtils.ONLINE_APPLICATION_URL+OnlineUtils.ONLINE_APPLICATION_ACTIONNAME, params);
			ajaxJson.setData(res);
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		return ajaxJson;
	}
	
	/**
	 * 异步调用 - 
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getSPApplication", method = RequestMethod.POST)
	public AjaxJson getSPApplication(HttpServletRequest request, HttpServletResponse response){
		AjaxJson ajaxJson = new AjaxJson();
		String applicantDocumentNumber = request.getParameter("applicantDocumentNumber");
		String applicantDocumentType =  request.getParameter("applicantDocumentType");
		String params_0="status=2&applicantDocumentNumber="+applicantDocumentNumber+"&applicantDocumentType="+applicantDocumentType;
		String params_1="status=3&applicantDocumentNumber="+applicantDocumentNumber+"&applicantDocumentType="+applicantDocumentType;
		try {
			String ret_0 = HttpRequest.sendPost(OnlineUtils.INTERFACEURL+OnlineUtils.ONLINE_APPLICATION_URL+OnlineUtils.ONLINE_APPLICATION_ACTIONNAME,params_0);
			String ret_1 = HttpRequest.sendPost(OnlineUtils.INTERFACEURL+OnlineUtils.ONLINE_APPLICATION_URL+OnlineUtils.ONLINE_APPLICATION_ACTIONNAME,params_1);
			ajaxJson.setData(ret_0.substring(0, ret_0.length() - 1) + ret_1.substring(1, ret_1.length()));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ajaxJson;
	}
	
	/**
	 * 异步调用 - 通过身份证得到材料信息
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/getMaterialsByUserIdList", method = RequestMethod.POST)
	public AjaxJson getMaterialsByUserIdList(HttpServletRequest request, HttpServletResponse response){
		AjaxJson ajaxJson = new AjaxJson();
		String userIdCard = request.getParameter("userIdCard");
		String userType = request.getParameter("userType");
		String params = "userIdCard="+userIdCard+"&userType="+userType;
		try {
			String res = HttpRequest.sendPost(OnlineUtils.INTERFACEURL+OnlineUtils.ONLINE_MATERIAL_URL+OnlineUtils.ONLINE_APPLICATION_MATERIAL_ACTIONNAME, params);
			ajaxJson.setData(res);
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		return ajaxJson;
	}
	
	/**
	 * 异步调用 - 实名认证
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/doRealName", method = RequestMethod.POST)
	public AjaxJson doRealName(HttpServletRequest request, HttpServletResponse response){
		AjaxJson ajaxJson = new AjaxJson();
		String idCard = request.getParameter("idCard");
		String type = request.getParameter("type");
		String params = "idCard="+idCard+"&type="+type;
		try {
			String res = HttpRequest.sendPost(OnlineUtils.INTERFACEURL+OnlineUtils.ONLINE_RAPPLYPERSON_URL+OnlineUtils.ONLINE_REPPLYPERSON_ACTIONNAME, params);
			ajaxJson.setData(res);
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}
		return ajaxJson;
	}
	
}
