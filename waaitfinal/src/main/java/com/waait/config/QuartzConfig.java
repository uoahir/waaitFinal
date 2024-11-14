package com.waait.config;

import org.quartz.CronScheduleBuilder;
import org.quartz.CronTrigger;
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

//	@Bean
//	public Scheduler scheduler() throws SchedulerException{
//		Scheduler scheduler = new StdSchedulerFactory().getScheduler();
//		scheduler.start();
//		return scheduler;
//	}
	
//	@Bean
//	public JobDetail deleteDocumentJobDetail() {
//		
//		// Job 생성
//		return JobBuilder.newJob(DeleteEdocController.class)
//				.withIdentity("deleteDocumentJob", "group1")
//				.storeDurably() // Job 을 저장소에 저장
//				.build();
//	}
//	
//	
//	@Bean
//	public Trigger deleteDocumnetTrigger() {
//		
//		return TriggerBuilder.newTrigger()
//				.forJob(deleteDocumentJobDetail())
//				.withIdentity("myTrigger", "group1")
//				.startNow()
//				.withSchedule(SimpleScheduleBuilder.simpleSchedule()
//						.withIntervalInHours(1) //한 시간 마다 한번씩 실행
//						.repeatForever())
//				.build();
//	}
	
//	@Bean
//	public CronTrigger deleteDocumentTrigger() {
//		return TriggerBuilder.newTrigger()
//				.forJob(deleteDocumentJobDetail())
//				.withIdentity("deleteDocumentCronTrigger", "group1")
//				.withSchedule(CronScheduleBuilder.cronSchedule("0 0 0 * * ?")) // 순서대로 초 분 시 일 월 요일 [년도] 매일 자정 실행 
//				.build();
//				
//	}
}
	
