package com.idea.modules.task.utils;

import com.idea.modules.task.entity.ScheduleJob;

public class ScheduleJobUtils {
     public static com.idea.core.quartz.data.ScheduleJob entityToData(ScheduleJob scheduleJobEntity){
    	 com.idea.core.quartz.data.ScheduleJob scheduleJob=new com.idea.core.quartz.data.ScheduleJob();
    	 scheduleJob.setBeanClass(scheduleJobEntity.getBeanClass());
    	 scheduleJob.setCronExpression(scheduleJobEntity.getCronExpression());
    	 scheduleJob.setDescription(scheduleJobEntity.getDescription());
    	 scheduleJob.setIsConcurrent(scheduleJobEntity.getIsConcurrent());
    	 scheduleJob.setJobName(scheduleJobEntity.getJobName());
    	 scheduleJob.setJobGroup(scheduleJobEntity.getJobGroup());
    	 scheduleJob.setJobStatus(scheduleJobEntity.getJobStatus());
    	 scheduleJob.setMethodName(scheduleJobEntity.getMethodName());
    	 scheduleJob.setSpringBean(scheduleJobEntity.getSpringBean());
    	 return scheduleJob;
     }
}
