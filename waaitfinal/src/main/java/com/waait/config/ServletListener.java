package com.waait.config;

import org.springframework.context.annotation.Configuration;

import jakarta.servlet.ServletContextEvent;
import jakarta.servlet.ServletContextListener;
import jakarta.servlet.annotation.WebListener;
import lombok.RequiredArgsConstructor;


@WebListener
@Configuration	//Spring에서 설정 클래스를 정의하고 관리하 위해 사용함.
@RequiredArgsConstructor
public class ServletListener implements ServletContextListener{

	private final SpringScheduler scheduler;	
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("서버 시작");
		scheduler.msgPrint(); //스케쥴러 최초 실행
	}

	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("서버 종료");
		//저장하고 있는 문자메세지를 DB에 저장시키는 로직 실행
	}
	
	
	
}
