package com.waait.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

@Configuration
@EnableScheduling	//선언하면 메소드에 @Scheduled선언가능 스케쥴러
public class SpringScheduler {
	
	@Scheduled(cron="00 50 * * * ?")	// 매시간 50분 마다 실행
	public void msgPrint() {
		System.out.println("쉬는시간~");
	}
	
}
