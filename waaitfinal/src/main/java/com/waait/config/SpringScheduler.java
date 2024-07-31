package com.waait.config;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import com.waait.dto.Employee;
import com.waait.dto.TodayWork;
import com.waait.dto.Work;
import com.waait.service.EmployeeService;
import com.waait.service.WorkService;

import lombok.RequiredArgsConstructor;

@Configuration
@EnableScheduling // 선언하면 메소드에 @Scheduled선언가능 스케쥴러
@RequiredArgsConstructor
public class SpringScheduler {
	/*
	 * private final WorkService workService; private EmployeeService
	 * employeeService;
	 */

	@Scheduled(cron = "00 50 * * * ?") // 매시간 50분 마다 실행
	public void msgPrint() {
		System.out.println("쉬는시간~");
	}

	// 30일 지난 메세지 삭제

	// 채팅방에 참여된 모든 사원이 나가면 채팅방을 delete하면서 채팅기록도 같이 delete해주기...?
	/*@Scheduled(cron = "0 59 23 * * ?")
	public void yourScheduledMethod() {
		// 오늘 날짜 출력
		LocalDateTime now = LocalDateTime.now();
		Timestamp timestamp = Timestamp.valueOf(now);
		String today = "20" + (timestamp.getYear() % 100) + "-" + (timestamp.getMonth() + 1) + "-"
				+ (timestamp.getDate());
		List<Long> noList = workService.selectAllNo(today); // 휴무 번호 emp 번호

		List<Employee> emplist = employeeService.selectAllEmployees(); // empNo출력 리스트
		List<Work> workList = workService.selectTodayAllWorkList(today);

		List<TodayWork> TodayworkList = new ArrayList<TodayWork>(); // 값넣어주는거
		for (int i = 0; i < emplist.size(); i++) {
			for (int w = 0; w < workList.size(); w++) {
				if (emplist.get(i).getEmpNo() == workList.get(w).getEmpNo()) {
					if (workList.get(w).getWorkEnd() != null && workList.get(w).getWorkStart() != null) {
						if (workList.get(w).getWorkStatus().equals("비정상")) {
							TodayworkList.add(TodayWork.builder().empNo(emplist.get(i).getEmpNo()).workLate("Y").workFastEnd("Y").workAbsent("N").workOver((workList.get(w).getWorkEnd().getHours()-workList.get(w).getWorkStart().getHours())>9?"Y":"N").workOff("N").build());
						} else if (workList.get(w).getWorkStatus().equals("조기퇴근")) {
							
								TodayworkList.add(TodayWork.builder().empNo(emplist.get(i).getEmpNo()).workLate("N").workFastEnd("Y").workAbsent("N").workOver((workList.get(w).getWorkEnd().getHours()-workList.get(w).getWorkStart().getHours())>9?"Y":"N").workOff("N").build());	
							
						} else if (workList.get(w).getWorkStatus().equals("지각")) {
							TodayworkList.add(TodayWork.builder().empNo(emplist.get(i).getEmpNo()).workLate("Y").workFastEnd("N").workAbsent("N").workOver((workList.get(w).getWorkEnd().getHours()-workList.get(w).getWorkStart().getHours())>9?"Y":"N").workOff("N").build());
						} else { // null 
							TodayworkList.add(TodayWork.builder().empNo(emplist.get(i).getEmpNo()).workLate("N").workFastEnd("N").workAbsent("N").workOver((workList.get(w).getWorkEnd().getHours()-workList.get(w).getWorkStart().getHours())>9?"Y":"N").workOff("N").build());		
						}
					}
				}else {
					TodayworkList.add(TodayWork.builder().empNo(emplist.get(i).getEmpNo()).workLate("N").workFastEnd("N").workAbsent("N").workOver("N").workOff("Y").build());
				}
			}
		}
		for (int i = 0; i < noList.size(); i++) {
			TodayworkList.add(TodayWork.builder().empNo(emplist.get(i).getEmpNo()).workLate("N").workFastEnd("N").workAbsent("N").workOver("N").workOff("Y").build()); //w
		
		}

		
		int result = workService.insertDateStatus(TodayworkList); 
	}*/

}
