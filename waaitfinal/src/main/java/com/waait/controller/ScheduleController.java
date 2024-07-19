package com.waait.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.waait.dto.Employee;
import com.waait.dto.Schedule;
import com.waait.service.ScheduleService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/schedule")
@Controller
@RequiredArgsConstructor
public class ScheduleController {
	
	private final ScheduleService service;	
	
	// DB에 저장되어 있는 일정 사용자 정보 통해서 가져오기
	@GetMapping("/myschedule")
	public String myschedule(Schedule empNo, Model model) {
		
		Schedule schedule = new Schedule();
		
		Employee employee = getLoginEmpInfo();		
		long empNumber = employee.getEmpNo();				
		/* Schedule emoNo=empNumber */
		
		List<Schedule> total=service.scheduleList(empNumber);
		System.out.println(total);
		schedule.setEmpNo(empNumber);
		
		model.addAttribute("total", total);		
//		System.out.println("스케줄"+schedule.getScheNo());
		total.forEach(e -> {
			System.out.println(e);
		});
		
		return "schedule/schedulemain2";
	}
	
	// 사용자 로그인 시큐리티로 데이터 가져오기
	private Employee getLoginEmpInfo() {
		return (Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}	
		
	// 
	@RequestMapping("/insertSchedule.do")
	public String insertSchedule(Schedule s,String scheTimeData, String scheEndData) {
		try {
			//사용자가 입력한 날짜 및 시간 데이터를 Timestamp 객체로 변환하여 Schedule 객체의 scheTime 필드에 설정하는 역할
			SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd'T'HH:mm"); //Timestamp로 들어가서 파싱해주기
			s.setScheTime(new Timestamp(sdf.parse(scheTimeData).getTime())); // sdf.parse(scheTimeData): scheTimeData 문자열을 SimpleDateFormat을 사용하여 Date 객체로 변환
			s.setScheEnd(new Timestamp(sdf.parse(scheEndData).getTime()));
		}catch(ParseException e){
			e.printStackTrace();
		}
		Employee loginEmp=(Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		s.setEmpNo(loginEmp.getEmpNo());
		s.setScheWriter(loginEmp.getEmpName());
//		if(s.getScheAllDay()==null) {
//			s.setScheAllDay("false");
//		}
//		if(s.getSchePrivate()==null) {
//			s.setSchePrivate("N");
//		}
		
		int result=service.insertSchedule(s);
		return "redirect:/schedule/myschedule";
		
	}
	
	@RequestMapping("/updateSchedule.do")
	public String updateSchdule() {
		
		
		
		return "redirect:/schedule/myschedule";
	}
	
	
	
	
	
	
}

