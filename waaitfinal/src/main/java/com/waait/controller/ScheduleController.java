package com.waait.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
		
		return "schedule/schedulepage";
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
		
		if(s.getDeptCode().equals("deptCode")) {
			s.setDeptCode(null);
		}				
//		if(s.getScheAllDay()==null) {
//			s.setScheAllDay("false");
//		}
//		if(s.getSchePrivate()==null) {
//			s.setSchePrivate("N");
//		}       
		System.out.println(s);
		int result=service.insertSchedule(s);
		return "redirect:/schedule/myschedule";
		
	}
	
	@RequestMapping("/updateSchedule.do")
	public String updateSchdule(Schedule s,Model model,String scheTimeData, String scheEndData) {
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
		
		//deptCode란을 아무것도 선택 안하면 deptCode=deptCode로 들어오는데 
		//이럴 경우에 deptCode가 null로 들어오게 하기
		if(s.getDeptCode().equals("deptCode")) { //문자열은 equals로 비교해주는거 까먹고 있었음ㅋ
			s.setDeptCode(null);
		}
		int result=service.updateSchedule(s);
		System.out.println("어디가 문제"+s);
		
		String msg,loc;		
		if(result>0) {
			msg="일정 수정 성공";
		}else {
			msg="일정 수정 실패. 다시 시도하세요.";
		}
		loc="/schedule/myschedule";
		model.addAttribute("msg", msg);
		model.addAttribute("loc", loc);		
		System.out.println(" -----"+scheEndData);
		return "common/msg";
	}
	
	//삭제하기
	@PostMapping("/deleteSchedule.do")
	public String deleteSchedule(int scheNo,Model model) {
		
		String msg,loc;
		
		int result=service.deleteSchedule(scheNo);	
		if(result>0) {
			msg="일정 삭제 성공"; 
		}
		else {
			msg="삭제 실패. 다시 시도하세요";
		}		
		loc="/schedule/myschedule";					
		model.addAttribute("msg",msg);
		model.addAttribute("loc",loc);		
		return "common/msg";
	}
	//팀캘린더 뽑아오기
	@PostMapping("/teamSchedule.do")
	public @ResponseBody List<Schedule> teamSchedule(Model model,String deptCode) {
		System.out.println("deptCode : " + deptCode);
		List<Schedule> deptTotal=service.teamSchedule(deptCode);
		//model.addAttribute("total",deptTotal);
		System.out.println("teamSchedule : " + deptTotal);
		return deptTotal;
	}
	
	
	
	
	
}

