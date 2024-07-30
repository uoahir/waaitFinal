package com.waait.controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.waait.dto.Department;
import com.waait.dto.Employee;
import com.waait.dto.JobLevel;
import com.waait.dto.MovingDepartment;
import com.waait.service.EmailService;
import com.waait.service.EmployeeManagementService;

import jakarta.mail.MessagingException;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/manage")
@RequiredArgsConstructor
public class EmployeeManagementController {
	
	private final EmployeeManagementService service;
	private final EmailService emailService;
	private final BCryptPasswordEncoder encoder;
	//private final ObjectMapper mapper;
	
	//test
	@GetMapping("/empmanagemain.do")
	public String empManageMainView() {
		return "empmanage/empmanagemain";
	}
	
	//test
	@GetMapping("/enrollemployeeview.do")
	public String empEnrollView(Model model) {
		List<Department> departmentList = getDepartmentList();
		List<JobLevel> jobLevelList = service.getJobLevel();
		System.out.println("departmentList : " + departmentList);
		System.out.println("jobLevelList : " + jobLevelList);
		
		model.addAttribute("depts", departmentList);
		model.addAttribute("jobs", jobLevelList);
		return "empmanage/enrollemployee";
	}
	
	@PostMapping("/getteam.do")
	public @ResponseBody List<Department> getTeamByDeptCode(String deptCode) {
		if(deptCode.equals("noDept")) {
			List<Department> teamList = getTeamList();
			teamList = teamList.stream().filter(team -> {
				return team.getParentCode().equals("D1");
			}).collect(Collectors.toList());
			return teamList;
		} else {
			List<Department> teamList = service.getTeamListByDeptCode(deptCode);			
			return teamList;
		}
	}
	
	@GetMapping("/managemain.do")
	public String manageMainView(Model model) {
		List<Department> departmentList = getDepartmentList();
		
		System.out.println("departmentList : " + departmentList);
		
		List<Employee> employeeInfoList = service.getEmployees();
		System.out.println("employeeList : " + employeeInfoList);
		
		model.addAttribute("employees", employeeInfoList);
		model.addAttribute("depts", departmentList);
		return "empmanage/managemain";
	}
	
	@PostMapping("/enrollemployee.do")
	public String enrollEmployee(@ModelAttribute Employee emp, String engName, String usingEmail, String deptCode, String teamCode,
			MultipartFile profile, MultipartFile signfile, HttpSession session) {
		String signfilePath = session.getServletContext().getRealPath("/resources/upload/emp/signfile/");
		String profilePath = session.getServletContext().getRealPath("/resources/upload/emp/profile/");
		System.out.println("등록하려는 사원정보 : " + emp);
		System.out.println("사원등록 parameter => usingEmail : " + usingEmail + " deptCode : " + deptCode + " teamCode : " + teamCode);
		if(profile != null) {
			System.out.println("profile originalName : " + profile.getOriginalFilename());
			String oriName = profile.getOriginalFilename();
			String ext = oriName.substring(oriName.lastIndexOf("."));
			Date now = new Date(System.currentTimeMillis());
			int randomNum = (int) (Math.random() * 10000) + 1;
			String rename = engName + "profile" + (new SimpleDateFormat("yyyyMMdd_HHmmssSSS").format(now)) + "_"
								+ randomNum + ext;
			
			
			File dirProfile = new File(profilePath);
			if(!dirProfile.exists()) dirProfile.mkdirs();
			
			try {
				profile.transferTo(new File(profilePath, rename));
			} catch (IOException e) {
				e.printStackTrace();
			}
			emp.setEmpProfile(rename);
		}
		
		if(signfile != null) {
			System.out.println("signFile originalName : " + signfile.getOriginalFilename());
			String oriName = signfile.getOriginalFilename();
			String ext = oriName.substring(oriName.lastIndexOf("."));
			Date now = new Date(System.currentTimeMillis());
			int randomNum = (int) (Math.random() * 10000) + 1;
			String rename = engName + "signfile" + (new SimpleDateFormat("yyyyMMdd_HHmmssSSS").format(now)) + "_"
								+ randomNum + ext;
			
			
			File dirSignFile = new File(signfilePath);
			if(!dirSignFile.exists()) dirSignFile.mkdirs();
			
			try {
				signfile.transferTo(new File(signfilePath, rename));
			} catch (IOException e) {
				e.printStackTrace();
			}
			emp.setEmpSignfile(rename);
		}
		
		Date now = new Date(System.currentTimeMillis());
		int randomNum = (int) (Math.random() * 1000) + 1;
		String initialRandomPwd = new SimpleDateFormat("yyMMddHHmmss").format(now) + randomNum;
		String userId = engName + new SimpleDateFormat("yyMMmmSS").format(now);
		emp.setEmpId(userId);
		try {
			emailService.sendInitialIdAndPwd(usingEmail, userId, initialRandomPwd);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
		String encryptionPwd = encoder.encode("0000");
		
		String gender = "";
		if(emp.getEmpGender().equals("m")) {
			gender = "남성";
		} else {
			gender = "여성";
		}
		emp.setEmpEmail(engName + "@waait.com");
		emp.setEmpPwd(encryptionPwd);
		emp.setEmpGender(gender);
		
		if(deptCode.equals("noDept")) {
			emp.setDeptCode(teamCode);
		} else if(teamCode.equals("noTeam")){
			emp.setDeptCode(deptCode);
		} else {
			emp.setDeptCode(teamCode);
		}
		
		switch(emp.getLevelCode()) {
			case "L1" : emp.setBasicAnnualLeave(30);
						emp.setRemainingAnnualLeave(30); break;
			case "L2" : emp.setBasicAnnualLeave(25);
						emp.setRemainingAnnualLeave(25); break;
			case "L3" : emp.setBasicAnnualLeave(20);
						emp.setRemainingAnnualLeave(20); break;
			case "L4" : emp.setBasicAnnualLeave(15);
						emp.setRemainingAnnualLeave(15); break;
		}
		System.out.println("등록할 사원정보 : " + emp);
		
		int result = 0;
		result = service.enrollEmployee(emp);
		
		return null;
	}
	
	@PostMapping("/searchempformodifydept.do")
	public @ResponseBody Map<String, Object> searchEmpForModifyDepartment(@RequestBody Map<String, String> searchParam) {
		String empId = searchParam.get("empId");
		String empName = searchParam.get("empName");
		System.out.println("empId : " + empId + " empName : " + empName);
		
		Employee searchEmployee = service.searchEmpForModifyDepartment(searchParam);
		searchEmployee = setEmpFieldDeptName(searchEmployee);
		
		List<Department> departmentList = getDepartmentList();
		List<Department> teamList = getTeamList();
		System.out.println("searchEmployee : " + searchEmployee);
		
		Map<String, Object> responseMap = new HashMap<String, Object>();
		responseMap.put("searchEmployee", searchEmployee);
		responseMap.put("departments", departmentList);
		responseMap.put("teams", teamList);
		
		return responseMap;
	}
	
	@PostMapping("/changedeptselect.do")
	public @ResponseBody Map<String, Object> getTeamListByDeptCode(@RequestBody Map<String, String> paramMap) {
		String deptCode = paramMap.get("deptCode");
		System.out.println("deptCode : " + deptCode);
		List<Department> teamList = service.getTeamListByDeptCode(deptCode);
		
		Map<String, Object> responseMap = new HashMap<String, Object>();
		responseMap.put("teamList", teamList);
		
		return responseMap;
	}
	
	@PostMapping("/empmodifydept.do")
	public @ResponseBody int modifyEmployeeDept(String wantModifyDeptName, String wantModifyDeptCode, String wantModifyTeamCode, String empId) {
		int result = 0;
		System.out.println("wantModifyDeptCode : " + wantModifyDeptCode + " wantModifyTeamCode : " + wantModifyTeamCode);
		
		Employee emp = service.getEmployeeById(empId);
		emp = setEmpFieldDeptName(emp);
		
		Map<String, Object> modifyParam = new HashMap<String, Object>();
		modifyParam.put("wantModifyTeamCode", wantModifyTeamCode);
		modifyParam.put("wantModifyDeptCode", wantModifyDeptCode);
		modifyParam.put("empId", empId);
		modifyParam.put("empOriInfo", emp);
		modifyParam.put("wantModifyDeptName", wantModifyDeptName);
		
		result = service.modifyEmployeeDept(modifyParam);
		if(result < 0) return result;
		
		
		
		return result;
	}
	
	@PostMapping("/joinmovingdepartment.do")
	public @ResponseBody Map<String, Object> joinMovingDepartment(@RequestBody Map<String, String> param) throws Exception {
		System.out.println("param : " + param);
		String status = param.get("status");
		Map<String, Object> sqlParam = new HashMap<String, Object>();
		if(status.equals("date")) {
			System.out.println("date조건문 들어옴");
			String startDateStr = param.get("startDate");
			String endDateStr = param.get("endDate");
			Date startDate = new SimpleDateFormat("yyyy-MM-dd").parse(startDateStr);
			Date endDate = new SimpleDateFormat("yyyy-MM-dd").parse(endDateStr);
			
			sqlParam.put("status", status);
			sqlParam.put("startDate", startDate);
			sqlParam.put("endDate", endDate);
		} else {
			String searchParam = param.get("searchParam");
			
			sqlParam.put("status", status);
			sqlParam.put("searchParam", searchParam);
		}
		
		List<MovingDepartment> movingDepartmentList = service.searchMovingDepartment(sqlParam);
		System.out.println("joinList : " + movingDepartmentList);
		
		Map<String, Object> returnMap = Map.of("movingDepartmentList", movingDepartmentList);
		
		return returnMap;
	}
	
	@GetMapping("/enrolldepartment.do")
	public @ResponseBody int enrollDepartment(String deptName, String teamName) {
		int result = 0;
		System.out.println("deptName : " + deptName + " teamNameStr : " + teamName);
		List<Integer> existDeptCode = service.getDeptCode();
		existDeptCode.forEach(System.out::println);
		existDeptCode.sort((p, n) -> {
			return n - p;
		});
		System.out.println("========== 정렬후 ==========");
		existDeptCode.forEach(System.out::println);
		
		String newDeptCode = "D" + (existDeptCode.get(0) + 1);
		
		Map<String, Object> sqlParam = new HashMap<String, Object>();
		if(teamName == "") {
			System.out.println("공란");
			sqlParam.put("newDeptCode", newDeptCode);
			sqlParam.put("newDeptName", deptName + "부");
			
		} else {
			sqlParam.put("newDeptCodeNumber", existDeptCode.get(0) + 1);
			sqlParam.put("newDeptCode", newDeptCode);
			sqlParam.put("newDeptName", deptName + "부");
			sqlParam.put("newTeamNameStr", teamName);
		}
		
		result = service.enrollDepartment(sqlParam);
		
		return result;
	}
	
	@PostMapping("/enrollteam.do")
	public @ResponseBody int enrollTeam(@RequestBody Map<String, Object> jsonParam) {
		int result = 0;
		
		List<Integer> existDeptCode = service.getDeptCode();
		existDeptCode.forEach(System.out::println);
		existDeptCode.sort((p, n) -> {
			return n - p;
		});
		
		String newTeamCode = "D" + (existDeptCode.get(0) + 1);
		
		jsonParam.put("newTeamCode", newTeamCode);
		
		result = service.enrollTeam(jsonParam);
		
		return result;
	}
	
	
	public List<Employee> setEmpFieldDeptName(List<Employee> employeeList) {
		//List<Employee> employeeList = service.getEmployees();
		List<Department> departmentList = getDepartmentList();

		for(Employee e : employeeList) {
			if(e.getDepartment().getDeptCode() != "D1"
					&& e.getDepartment().getParentCode().equals("D1")) {
				e.setDeptName(e.getDepartment().getDeptName());
			}
			
			for(Department d : departmentList) {
				if(e.getDepartment().getParentCode().equals(d.getDeptCode())) {
					e.setDeptName(d.getDeptName());
				} else if(e.getDepartment().getDeptCode().equals(d.getDeptCode())) {
					e.setDeptName(d.getDeptName());
				}
			}
			
			if(e.getDeptName() == null) e.setDeptName("대표실");
		}
		return employeeList;
	}
	
	public Employee setEmpFieldDeptName(Employee emp) {
		List<Department> departmentList = getDepartmentList();
		
		if(emp.getDepartment().getDeptCode() != "D1"
				&& emp.getDepartment().getParentCode().equals("D1")) {
			emp.setDeptName(emp.getDepartment().getDeptName());
		}
		
		for(Department d : departmentList) {
			if(emp.getDepartment().getParentCode().equals(d.getDeptCode())) {
				emp.setDeptName(d.getDeptName());
			} else if(emp.getDepartment().getDeptCode().equals(d.getDeptCode())) {
				emp.setDeptName(d.getDeptName());
			}
		}
		
		if(emp.getDeptName() == null) emp.setDeptName("대표실");
		System.out.println("setFieldDeptName : " + emp);
		
		return emp;
	}
	
	public List<Department> getDepartmentList() {
		List<Department> departmentTableList = service.getDepartment();
		List<Department> departmentList = departmentTableList.stream().filter(dept -> {
			return dept.getDeptName().substring(dept.getDeptName().length() - 1).equals("부");
		}).collect(Collectors.toList());
		return departmentList;
	}
	
	public List<Department> getTeamList() {
		List<Department> departmentTableList = service.getDepartment();
		List<Department> teamList = departmentTableList.stream().filter(dept -> {
			return dept.getDeptName().substring(dept.getDeptName().length() - 1).equals("팀");
		}).collect(Collectors.toList());
		return teamList;
	}
}
