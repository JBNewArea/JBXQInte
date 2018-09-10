package com.idea.modules.sys.service;

import java.util.List;

import com.idea.core.common.service.ITreeCommonService;
import com.idea.modules.sys.entity.Menu;

/**
 * @Title:
 * @Description:
 * @author jwcg
 * @date 2014-12-20 21:33:32
 * @version V1.0
 *
 */
public interface IMenuService extends ITreeCommonService<Menu, String> {

	/**
	 * 通过用户ID查找菜单
	 * 
	 * @return
	 */
	List<Menu> findMenuByUserId(String userId);

	/**
	 * 通过角色查找菜单
	 * 
	 * @return
	 */
	List<Menu> findMenuByRoleId(String roleId);
}
