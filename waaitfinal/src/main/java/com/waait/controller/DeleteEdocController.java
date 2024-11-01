package com.waait.controller;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.stereotype.Controller;

import com.waait.service.DeleteEdocService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class DeleteEdocController implements Job{
	
	final DeleteEdocService deleteEdocService;

	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		System.out.println("나 스프링 쿼츠 야~ ");
		
		// 문서 만료일이 지났을 경우 데이터 베이스에서 해당 문서를 삭제하는 로직을 짜면 됨.
		// 오늘날짜 기준, 만료일이 오늘날짜 이전인 데이터를 지워주면 됨 ! 
		deleteEdocService.deleteEdoc(); 		
	}

}
