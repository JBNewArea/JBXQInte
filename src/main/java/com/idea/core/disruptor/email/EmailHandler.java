package com.idea.core.disruptor.email;

import com.lmax.disruptor.WorkHandler;
import com.idea.core.utils.email.Email;
import com.idea.core.utils.email.EmailResult;

/**
 * 
 * All rights Reserved, Designed By change.cn
 * 
 * @title: SmsHandler.java
 * @package com.idea.core.disruptor.sms
 * @description: 内容消费者
 * @author: 王存见
 * @date: 2017年6月7日 下午11:20:32
 * @version V1.0
 * @copyright: 2017 change.cn Inc. All rights reserved.
 *
 */
public class EmailHandler implements WorkHandler<EmailEvent> {
	private EmailDao emailDao;

	public EmailHandler(EmailDao emailDao) {
		this.emailDao = emailDao;
	}

	@Override
	public void onEvent(EmailEvent event) throws Exception {
		EmailResult emailResult = Email.newEmail().send(event.getEmailData().getEmail(),
				event.getEmailData().getSubject(), event.getEmailData().getContent());
		if (event.getHandlerCallBack() != null) {
			event.getHandlerCallBack().onResult(emailResult);
		}

		if (emailDao != null) {
			emailDao.doResult(event.getId(), event.getEmailData(), emailResult);
		}
	}

}