package com.idea.core.quartz.factory;

import org.apache.log4j.Logger;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

import com.idea.core.quartz.data.ScheduleJob;
import com.idea.core.quartz.utils.TaskUtils;

/**
 * 
 * All rights Reserved, Designed By change.cn
 * 
 * @title: QuartzJobFactoryDisallowConcurrentExecution.java
 * @package com.idea.core.quartz.factory
 * @description: 若一个方法一次执行不完下次轮转时则等待改方法执行完后才执行下一次操作
 * @author: 王存见
 * @date: 2017年5月10日 上午12:24:52
 * @version V1.0
 * @copyright: 2017 change.cn Inc. All rights reserved.
 *
 */
@DisallowConcurrentExecution
public class QuartzJobFactoryDisallowConcurrentExecution implements Job {
	public final Logger log = Logger.getLogger(this.getClass());

	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		ScheduleJob scheduleJob = (ScheduleJob) context.getMergedJobDataMap().get("scheduleJob");
		TaskUtils.invokMethod(scheduleJob);

	}
}