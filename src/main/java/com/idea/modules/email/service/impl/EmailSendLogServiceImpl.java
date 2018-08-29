package com.idea.modules.email.service.impl;

import com.idea.core.common.service.impl.CommonServiceImpl;
import com.idea.modules.email.entity.EmailSendLog;
import com.idea.modules.email.mapper.EmailSendLogMapper;
import com.idea.modules.email.service.IEmailSendLogService;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**   
 * @Title: 邮件发送日志
 * @Description: 邮件发送日志
 * @author jeeweb
 * @date 2017-06-10 07:46:06
 * @version V1.0   
 *
 */
@Transactional
@Service("emailSendLogService")
public class EmailSendLogServiceImpl  extends CommonServiceImpl<EmailSendLogMapper, EmailSendLog> implements  IEmailSendLogService {

	 
	 
}
