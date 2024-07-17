package com.waait.controller;

import java.util.List;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	private Employee getLoginEmpInfo() {
		return (Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}
	
//	@RequestMapping("/schedule.do")
//	public void getSchedule(HttpServletRequest request,
//				HttpServletResponse response) {
//		System.out.println(request);
//		System.out.println(response);
//		
//		//클라이언트가 보낸 데이터 받아오기
//		String scheTitle=request.getParameter("scheTitle");
//		String scheContent=request.getParameter("scheContent");
//		Timestamp scheTime=request.getParameter("scheTime");
//		Timestamp scheEnd=request.getParameter("scheEnd");
//		String scheColor=request.getParameter("scheColor");
//		
//		Schedule s=Schedule.builder()
//				.scheTitle(scheTitle)
//				.scheContent(scheContent)
//				.scheTime(scheTime)
//				.scheEnd(scheEnd)
//				.scheColor(scheColor)
//				.build();
//		System.out.println(s);
//		
//		request.setAttribute("schedule", s);
//		request.getRequestDispatcher("/WEB-INF/views/shcedule/schedulemain2.jsp")
//		.forward(request, response);
//	}
	
	@RequestMapping("/insertSchedule.do")
	public String insertSchedule(Schedule s) {
		log.debug("{}",s);
		int result=service.insertSchedule(s);
		return "redirect:/schedule/myschedule";
		
		
	}
	
	
	
	

	
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
//	}
//	
//	// 일정 db에 추가하기 
//	@GetMapping("/insertschedule.do")
//	public void insertSchedule(@ModelAttribute("schedule") @Validated Schedule schedule,
//			BindingResult isResult,Model m) {
//		if(isResult.hasErrors()) {
//			m.add
//		}
//		
//		
//	}
	
//	@GetMapping("/myschedule.do")
//	public void myschedule() {			
//		
//		
//	}
	
	

}
