package com.waait.config;

import org.quartz.JobBuilder;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SimpleScheduleBuilder;
import org.quartz.Trigger;
import org.quartz.TriggerBuilder;
import org.quartz.impl.StdSchedulerFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.waait.controller.DeleteEdocController;

@Configuration
public class QuartzConfig {

	@Bean
	public Scheduler scheduler() throws SchedulerException{
		Scheduler scheduler = new StdSchedulerFactory().getScheduler();
		scheduler.start();
		return scheduler;
	}
	
	@Bean
	public JobDetail deleteDocumentJobDetail() {
		
		// Job 생성
		return JobBuilder.newJob(DeleteEdocController.class)
				.withIdentity("deleteDocumentJob", "group1")
				.storeDurably() // Job 을 저장소에 저장
				.build();
	}
	
	
	@Bean
	public Trigger deleteDocumnetTrigger() {
		
		// Trigger 생성
		return TriggerBuilder.newTrigger()
				.forJob(deleteDocumentJobDetail())
				.withIdentity("myTrigger", "group1")
				.startNow()
				.withSchedule(SimpleScheduleBuilder.simpleSchedule()
						.withIntervalInMinutes(10)
						.repeatForever())
				.build();
	}
}
	
