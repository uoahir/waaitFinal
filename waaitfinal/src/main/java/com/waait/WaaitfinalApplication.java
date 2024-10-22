package com.waait;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling // 이 어노테이션을 붙여줘야 스프링 스케줄러 사용이 가능해진다 ! 
public class WaaitfinalApplication {

	public static void main(String[] args) {
		SpringApplication.run(WaaitfinalApplication.class, args);
	}

}
