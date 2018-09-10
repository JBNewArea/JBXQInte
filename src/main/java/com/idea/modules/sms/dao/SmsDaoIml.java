package com.idea.modules.sms.dao;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;

import com.baomidou.mybatisplus.mapper.EntityWrapper;

import com.idea.core.disruptor.sms.SmsDao;
import com.idea.core.disruptor.sms.SmsData;
import com.idea.core.utils.StringUtils;
import com.idea.core.utils.sms.data.SmsResult;
import com.idea.modules.sms.entity.SmsSendLog;
import com.idea.modules.sms.entity.SmsTemplate;
import com.idea.modules.sms.service.ISmsSendLogService;
import com.idea.modules.sms.service.ISmsTemplateService;

/**
 * 
 * All rights Reserved, Designed By change.cn
 * 
 * @title: SmsDaoIml.java
 * @package com.idea.modules.sms.dao
 * @description: 短信信息返回
 * @author: 王存见
 * @date: 2017年6月8日 上午11:20:04
 * @version V1.0
 * @copyright: 2017 change.cn Inc. All rights reserved.
 *
 */
public class SmsDaoIml implements SmsDao {
	@Autowired
	private ISmsSendLogService smsSendLogService;
	@Autowired
	private ISmsTemplateService smsTemplateService;

	@Override
	public void doStart() {

	}

	@Override
	public void doSend(String eventId, SmsData smsData) {
		SmsSendLog smsSendLog = new SmsSendLog();
		smsSendLog.setId(eventId);
		String templateId = smsData.getSmsTemplate().getTemplateId();
		try {
			SmsTemplate smsTemplateEntity = smsTemplateService
					.selectOne(new EntityWrapper<SmsTemplate>().eq("templateId", templateId));
			if (smsTemplateEntity != null) {
				smsSendLog.setBusinessType(smsTemplateEntity.getBusinessType());
			} else {
				smsSendLog.setBusinessType("99");
			}
		} catch (Exception e) {
			smsSendLog.setBusinessType("99");
		}

		smsSendLog.setTemplateContent(smsData.getSmsTemplate().getTemplateContent());
		smsSendLog.setTemplateId(smsData.getSmsTemplate().getTemplateId());
		smsSendLog.setPhone(smsData.getPhone());
		smsSendLog.setSenddata(StringUtils.join(smsData.getDatas(), ","));
		smsSendLog.setStatus("0");
		smsSendLogService.insert(smsSendLog);
	}

	@Override
	public void doResult(String eventId, SmsData smsData, SmsResult smsResult) {
		SmsSendLog smsSendLog = smsSendLogService.selectById(eventId);
		smsSendLog.setCode(smsResult.getCode());
		smsSendLog.setMsg(smsResult.getMsg());
		smsSendLog.setSmsid(smsResult.getSmsid());
		if (smsResult.isSuccess()) {
			smsSendLog.setStatus("1");
		} else {
			smsSendLog.setStatus("0");
		}
		smsSendLog.setResponseDate(new Date());
		smsSendLogService.insertOrUpdate(smsSendLog);
	}

	@Override
	public void doShutdown() {

	}

}
