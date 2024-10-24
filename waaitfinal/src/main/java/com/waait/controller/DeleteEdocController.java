package com.waait.controller;



import java.sql.Date;
import java.time.LocalDate;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.stereotype.Controller;

import com.waait.dto.TodayWork;

@Controller
public class DeleteEdocController implements Job{

	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		// TODO Auto-generated method stub
		System.out.println("나 스프링 쿼츠 야~ ");
		// 오늘 날짜와 문서 만료기한 날짜가 같을 경우 데이터 베이스에서 해당 문서를 삭제하는 로직을 짜면 됨.
		LocalDate today = LocalDate.now();
		System.out.println(today);
		
		
	}

}
