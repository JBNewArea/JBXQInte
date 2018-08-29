package com.idea.modules.email.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.idea.core.common.controller.BaseCRUDController;
import com.idea.core.security.shiro.authz.annotation.RequiresPathPermission;
import com.idea.modules.email.entity.EmailSendLog;

/**   
 * @Title: 邮件发送日志
 * @Description: 邮件发送日志
 * @author jeeweb
 * @date 2017-06-10 07:46:06
 * @version V1.0   
 *
 */
@Controller
@RequestMapping("${admin.url.prefix}/email/emailsendlog")
@RequiresPathPermission("email:emailsendlog")
public class EmailSendLogController extends BaseCRUDController<EmailSendLog, String> {

}
