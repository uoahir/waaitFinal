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
	
	// 30일 지난 메세지 삭제
	
	// 채팅방에 참여된 모든 사원이 나가면 채팅방을 delete하면서 채팅기록도 같이 delete해주기...?
	
	
	
}
