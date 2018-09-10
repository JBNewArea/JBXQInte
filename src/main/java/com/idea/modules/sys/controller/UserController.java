package com.idea.modules.sys.controller;

import com.idea.core.common.controller.BaseCRUDController;
import com.idea.core.model.AjaxJson;
import com.idea.core.query.data.Queryable;
import com.idea.core.query.wrapper.EntityWrapper;
import com.idea.core.security.shiro.authz.annotation.RequiresPathPermission;
import com.idea.core.utils.JeewebPropertiesUtil;
import com.idea.core.utils.MyBeanUtils;
import com.idea.core.utils.StringUtils;
import com.idea.modules.sys.entity.Organization;
import com.idea.modules.sys.entity.Role;
import com.idea.modules.sys.entity.User;
import com.idea.modules.sys.entity.UserOrganization;
import com.idea.modules.sys.entity.UserRole;
import com.idea.modules.sys.service.IOrganizationService;
import com.idea.modules.sys.service.IRoleService;
import com.idea.modules.sys.service.IUserOrganizationService;
import com.idea.modules.sys.service.IUserRoleService;
import com.idea.modules.sys.service.IUserService;
import com.idea.modules.sys.utils.UserUtils;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * 
 * All rights Reserved, Designed By change.cn
 * 
 * @title: UserController.java
 * @package com.idea.modules.sys.controller
 * @description: 用户操作控制器
 * @author: 王存见
 * @date: 2017年5月25日 上午9:52:20
 * @version V1.0
 * @copyright: 2017 change.cn Inc. All rights reserved.
 *
 */
@Controller
@RequestMapping("${admin.url.prefix}/sys/user")
@RequiresPathPermission("sys:user")
public class UserController extends BaseCRUDController<User, String> {
	@Autowired
	private IUserService userService;

	@Autowired
	private IUserRoleService userRoleService;

	@Autowired
	private IRoleService roleService;
	@Autowired
	private IOrganizationService organizationService;
	@Autowired
	private IUserOrganizationService userOrganizationService;

	public UserController() {
		setCommonService(userService);
	}

	@Override
	public String showCreate(User user, Model model, HttpServletRequest request, HttpServletResponse response) {
		return display("create");
	}

	@RequestMapping(value = "{id}/changePassword", method = RequestMethod.GET)
	public String changePassword(@PathVariable("id") String id, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		User user = userService.selectById(id);
		model.addAttribute("data", user);
		return display("changePassword");
	}

	@RequestMapping(value = "{id}/changePassword", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson changePassword(@PathVariable("id") String id, HttpServletRequest request,
			HttpServletResponse response) {
		AjaxJson ajaxJson = new AjaxJson();
		ajaxJson.success("密码修改成功");
		if (JeewebPropertiesUtil.getProperties().getBoolean("demoMode")) {
			ajaxJson.fail("演示模式，不允许修改密码！");
			return ajaxJson;
		}
		try {
			String password = request.getParameter("password");
			userService.changePassword(id, password);
		} catch (Exception e) {
			e.printStackTrace();
			ajaxJson.fail("密码修改失败");
		}
		return ajaxJson;
	}

	@RequestMapping(value = "{id}/avatar", method = RequestMethod.GET)
	public String avatar(@PathVariable("id") String id, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		User user = userService.selectById(id);
		model.addAttribute("data", user);
		return display("avatar");
	}

	@RequestMapping(value = "{id}/avatar", method = RequestMethod.POST)
	@ResponseBody
	public AjaxJson avatar(User user, HttpServletRequest request, HttpServletResponse response) {
		AjaxJson ajaxJson = new AjaxJson();
		ajaxJson.success("头像修改成功");
		try {
			User oldUser = commonService.selectById(user.getId());
			MyBeanUtils.copyBeanNotNull2Bean(user, oldUser);
			commonService.insertOrUpdate(oldUser);
			String currentUserId = UserUtils.getUser().getId();
			if (currentUserId.equals(user.getId())) {
				UserUtils.clearCache();
			}
		} catch (Exception e) {
			e.printStackTrace();
			ajaxJson.fail("头像修改失败");
		}
		return ajaxJson;
	}

	@Override
	public void preEdit(User user, Model model, HttpServletRequest request, HttpServletResponse response) {
		// 查询所有的角色List
		List<Role> allRoles = roleService.selectList(new EntityWrapper<Role>());
		request.setAttribute("allRoles", allRoles);
		if (!StringUtils.isEmpty(user.getId())) {
			// 查找关联角色
			List<Role> userRoles = roleService.findListByUserId(user.getId());
			request.setAttribute("roleIdList", userRoles);
			List<Organization> organizations = organizationService.findListByUserId(user.getId());
			String organizationIds = "";
			String organizationNames = "";
			for (Organization organization : organizations) {
				if (!StringUtils.isEmpty(organizationIds)) {
					organizationIds += ",";
					organizationNames += ",";
				}
				String organizationId = organization.getId();
				organizationIds += organizationId;
				organizationNames += organization.getName();

			}
			request.setAttribute("organizationIds", organizationIds);
			request.setAttribute("organizationNames", organizationNames);
		}
	}

	@Override
	public void preAjaxList(Queryable queryable,EntityWrapper<User> entityWrapper,HttpServletRequest request,
			HttpServletResponse response) {
		// 子查询
		String organizationid = request.getParameter("organizationid");
		if (!StringUtils.isEmpty(organizationid)) {
			entityWrapper.eq("uo.organization_id", organizationid);
		}
	}

	@Override
	public void preSave(User entity, HttpServletRequest request, HttpServletResponse response) {

	}

	@Override
	public void afterSave(User entity, HttpServletRequest request, HttpServletResponse response) {
		// 删除角色关联
		String[] roleIdList = request.getParameterValues("roleIdList");
		if (roleIdList != null && roleIdList.length > 0) {
			userRoleService.delete(new EntityWrapper<UserRole>(UserRole.class).eq("userId", entity.getId()));
			List<UserRole> userRoleList = new ArrayList<UserRole>();
			for (String roleid : roleIdList) {
				UserRole userRole = new UserRole();
				userRole.setUserId(entity.getId());
				userRole.setRoleId(roleid);
				userRoleList.add(userRole);
			}
			userRoleService.insertBatch(userRoleList);
		}

		// 删除部门关联
		String organizationIdListStr = request.getParameter("organizationIds");
		String[] organizationIdList = organizationIdListStr.split(",");
		if (organizationIdList != null && organizationIdList.length > 0) {
			userOrganizationService.delete(new EntityWrapper<UserOrganization>(UserOrganization.class).eq("userId", entity.getId()));
			List<UserOrganization> userOrganizationList = new ArrayList<UserOrganization>();
			for (String organizationId : organizationIdList) {
				UserOrganization userOrganization = new UserOrganization();
				userOrganization.setUserId(entity.getId());
				userOrganization.setOrganizationId(organizationId);
				userOrganizationList.add(userOrganization);
			}
			userOrganizationService.insertBatch(userOrganizationList);
		}
	}

	@RequestMapping(value = "info", method = RequestMethod.GET)
	public String info(@RequestParam(required = false) String id, Model model, HttpServletRequest request,
			HttpServletResponse response) {
		User user = userService.selectById(id);
		model.addAttribute("data", user);
		return display("info");
	}
}