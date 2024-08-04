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
import com.waait.dto.TeamProject;
import com.waait.dto.TodayWork;
import com.waait.dto.Work;
import com.waait.service.EmployeeService;
import com.waait.service.TeamProjectService;
import com.waait.service.WorkService;

import lombok.RequiredArgsConstructor;

@Configuration
@EnableScheduling // 선언하면 메소드에 @Scheduled선언가능 스케쥴러
@RequiredArgsConstructor
public class SpringScheduler {
	
	  private final WorkService workService; 
	  private final EmployeeService employeeService;
	  private final TeamProjectService teamProjectService;

	@Scheduled(cron = "00 50 * * * ?") // 매시간 50분 마다 실행
	public void msgPrint() {
		System.out.println("쉬는시간~");
	}

	// 30일 지난 메세지 삭제

	// 채팅방에 참여된 모든 사원이 나가면 채팅방을 delete하면서 채팅기록도 같이 delete해주기...?
	@Scheduled(cron = "0 59 23 * * ?") //하루 기준으로 해당 날에 값 넣어준거  
	public void yourScheduledMethod() {
		// 오늘 날짜 출력
        LocalDateTime now = LocalDateTime.now();
        Timestamp timestamp = Timestamp.valueOf(now);
        String today = "20" + (timestamp.getYear() % 100) + "-" + (timestamp.getMonth() + 1) + "-"
                + (timestamp.getDate());
        List<Long> noList = workService.selectAllNo(today); // 휴무 번호 emp 번호
        System.out.println("noList" + noList);
        List<Employee> emplist = employeeService.selectAllEmployees(); // empNo출력 리스트
        System.out.println("emplist" + emplist.size());
        List<Work> workList = workService.selectTodayAllWorkList(today);
        System.out.println("workList" + workList);
        List<TodayWork> TodayworkList = new ArrayList<>(); // 값넣어주는거

        for (Employee emp : emplist) {
            long empNo = emp.getEmpNo();

            // 먼저 휴무 목록에 있는지 확인
            if (noList.contains(empNo)) {
                TodayworkList.add(TodayWork.builder()
                        .empNo(empNo)
                        .workLate("N")
                        .workFastEnd("N")
                        .workAbsent("N")
                        .workOver("N")
                        .workOff("Y")
                        .build());
                continue; // 다음 직원으로 넘어감
            }

            // 근무 목록에서 직원의 상태를 확인
            boolean workAdded = false;
            for (Work work : workList) {
                if (work.getEmpNo() == empNo) {
                    TodayWork.TodayWorkBuilder todayWorkBuilder = TodayWork.builder()
                            .empNo(empNo)
                            .workLate("N")
                            .workFastEnd("N")
                            .workAbsent("N")
                            .workOff("N");

                    if (work.getWorkEnd() != null && work.getWorkStart() != null) {
                        if (work.getWorkStatus().equals("비정상")) {
                            todayWorkBuilder.workLate("Y").workFastEnd("Y");
                        } else if (work.getWorkStatus().equals("조기퇴근")) {
                            todayWorkBuilder.workFastEnd("Y");
                        } else if (work.getWorkStatus().equals("지각")) {
                            todayWorkBuilder.workLate("Y");
                        }
                        todayWorkBuilder.workOver(
                                (work.getWorkEnd().getHours() - work.getWorkStart().getHours()) > 9 ? "Y" : "N");
                    }

                    TodayworkList.add(todayWorkBuilder.build());
                    workAdded = true;
                    break; // 근무 목록 루프를 빠져나옴
                }
            }

            // 근무 상태가 추가되지 않았다면 기본 상태를 추가
            if (!workAdded) {
                TodayworkList.add(TodayWork.builder()
                        .empNo(empNo)
                        .workLate("N")
                        .workFastEnd("N")
                        .workAbsent("N")
                        .workOver("N")
                        .workOff("Y")
                        .build());
            }
        }

        System.out.println(TodayworkList);

        int result = workService.insertDateStatus(TodayworkList);
	}
	
	@Scheduled(cron = "00 01 01 * * ?")
	public void projectUpdateStatus() {
		 LocalDateTime now = LocalDateTime.now();
	        Timestamp timestamp = Timestamp.valueOf(now);
	        String today = "20" + (timestamp.getYear() % 100) + "-" + (timestamp.getMonth() + 1) + "-"
	                + (timestamp.getDate());
	       int rs  = teamProjectService.projectUpdateStatus(today);
	       System.out.println("업데이트한 값 " + rs);
	}
}
