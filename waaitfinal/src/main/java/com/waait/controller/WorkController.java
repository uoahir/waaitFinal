package com.waait.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.waait.dto.Employee;
import com.waait.dto.Work;
import com.waait.service.WorkService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class WorkController {

	private final WorkService workService;
	@ResponseBody
	@PostMapping("/insert/work") //출근시 
	public ResponseEntity<Map<String,String>> insertWorkStart() {
		
		LocalDateTime now = LocalDateTime.now(); 
		Timestamp timestamp = Timestamp.valueOf(now);
		Employee employee = (Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		 Work work = Work.builder()
                 .empNo(employee.getEmpNo())
                 .workStart(timestamp)
                 .build();
		if (timestamp.getHours() > 8 && timestamp.getMinutes() > 0) { // 9시 0분기준
			work.setWorkStatus("지각");
		} else {
			work.setWorkStatus("null");
		}
		
		System.out.println(work.getWorkStart());
		int rs = workService.insertWorkStart(work);
		System.out.println("현재시간" + now);
		System.out.println("타임스탬프" + timestamp);
		
		System.out.println(timestamp.getHours()); // 시
		System.out.println(timestamp.getMinutes());// 분
		System.out.println(timestamp.getMinutes()); // 초
		Map<String, String> result = new HashMap<>();
		return ResponseEntity.ok(result);

	}
	@ResponseBody
	@PostMapping("/insert/leavework")
	public ResponseEntity<Map<String,String>> insertLeaveWork(){
		LocalDateTime now = LocalDateTime.now();
		Timestamp timestamp = Timestamp.valueOf(now);
		Employee employee = (Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Map<String, String> param = new HashMap<>();
		String today = "20"+(timestamp.getYear()%100)+"-"+(timestamp.getMonth()+1)+"-"+(timestamp.getDate());
		param.put("today", today);
		param.put("empNo",""+employee.getEmpNo());
		
		Work todaywork = workService.selectByEmpNoWork(param);
		System.out.println("ddd"+todaywork);
		Work work = Work.builder().workDate(timestamp).empNo(employee.getEmpNo()).workEnd(timestamp).build();
		if(todaywork.getWorkStatus()!=null) {
			if(timestamp.getHours()>17 && timestamp.getMinutes()>=0) {
				work.setWorkStatus("지각");
			}else {
				work.setWorkStatus("비정상");
			}
		}else {
			work.setWorkStatus("정상");
		}
		System.out.println("Dd"+work);
		System.out.println(today);
		Map<String, Object> map = new HashMap<>();
		map.put("today", today);
		map.put("work", work);
		int result = workService.insertLeaveWork(map);
		
		Map<String,String> rs= new HashMap<>();
		
		return ResponseEntity.ok(rs);
	}
}
