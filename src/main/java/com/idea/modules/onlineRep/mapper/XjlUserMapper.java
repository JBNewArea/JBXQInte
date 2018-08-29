package com.idea.modules.onlineRep.mapper;

import java.util.List;

import com.baomidou.mybatisplus.mapper.BaseMapper;
import com.idea.modules.onlineRep.entity.XJLUser;

public interface XjlUserMapper extends BaseMapper<XJLUser>  {

	 List<XJLUser> queryXjlUserList();
}
