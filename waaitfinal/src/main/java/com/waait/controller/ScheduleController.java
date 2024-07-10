package com.waait.controller;

import java.security.Principal;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.waait.dto.Schedule;
import com.waait.service.ScheduleService;

import lombok.RequiredArgsConstructor;

@RequestMapping("/schedule")
@Controller
@RequiredArgsConstructor
public class ScheduleController {
	
	private final ScheduleService service;	
	
//	//teamware 참고
//	@RequestMapping("/myschedule")
//	public void myschedule(Principal principal, Schedule schedule,Model model) {
//		String empId=principal.getName();
//		List<Schedule> scheduleList=service.scheduleList(empNo);
//		model.addAttribute("scheduleList", scheduleList);		
//		
//	}
//	
//	
//	
//	
//	@GetMapping("/myschedule.do")
//	public void mySchedule(
//			@RequestParam(defaultValue="1") int cPage,
//			@RequestParam(defaultValue="5") int numPerpage,
//			Model model) {
//		
//		List<Schedule> result=service.selectList(
//				Map.of("cPage",cPage,"numPerpage",numPerpage));
//		model.addAttribute("schedule", result);
//		int totalData=service.selectScheduleCount();
//
//		
//		
//	}

}
