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
		if (timestamp.getHours() > 9 && timestamp.getMinutes() > 0) { // 9시 0분기준
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
}
