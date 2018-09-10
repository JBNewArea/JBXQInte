package com.idea.modules.sys.service.impl;

import com.idea.core.common.service.impl.CommonServiceImpl;
import com.idea.modules.sys.entity.UserLastOnline;
import com.idea.modules.sys.mapper.UserLastOnlineMapper;
import com.idea.modules.sys.service.IUserLastOnlineService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
 * @Title: 最后在线情况
 * @Description: 最后在线情况
 * @author jeeweb
 * @date 2017-05-15 08:18:21
 * @version V1.0   
 *
 */
@Transactional
@Service("userLastOnlineService")
public class UserLastOnlineServiceImpl  extends CommonServiceImpl<UserLastOnlineMapper,UserLastOnline> implements  IUserLastOnlineService {

}
