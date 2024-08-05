package com.waait.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.waait.dto.Department;
import com.waait.dto.Employee;
import com.waait.dto.JobLevel;
import com.waait.dto.MovingDepartment;
import com.waait.service.EmployeeManagementService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/manage")
@RequiredArgsConstructor
public class EmployeeManagementController {
	
	private final EmployeeManagementService service;
	//private final EmailService emailService;
	private final BCryptPasswordEncoder encoder;
	//private final ObjectMapper mapper;
	
	public static String paging(int totalData, int cPage, int numPerpage, int pageBarSize, String url) {
		int totalPage = (int) Math.ceil((double) totalData/ numPerpage);
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;
		
		StringBuffer sb = new StringBuffer();
		sb.append("<ul class='pagination justify-content-center pagination-sm' style='margin-top : 50px;'>");
		if(pageNo == 1) {
			sb.append("<li class='page-item disabled'>");
			sb.append("<a class='page-link' href='#'>이전</a>");
			sb.append("</li>");
		} else {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='javascript:ajaxPaging(" + (pageNo - 1) + ",\"" + url + "\")'>이전</a>");
			sb.append("</li>");
		}
		
		while(!(pageNo > pageEnd || pageNo > totalPage)) {
			if(pageNo == cPage) {
				sb.append("<li class='page-item disabled'>");
				sb.append("<a class='page-link' href='#'>" + pageNo + "</a>");
				sb.append("</li>");
			} else {
				sb.append("<li class='page-item'>");
				sb.append("<a class='page-link' href='javascript:ajaxPaging(" + pageNo + ",\"" + url + "\")'>" + pageNo + "</a>");
				sb.append("</li>");
			}
			pageNo++;
		}
		
		if(pageNo > totalPage) {
			sb.append("<li class='page-item disabled'>");
			sb.append("<a class='page-link' href='#'>다음</a>");
			sb.append("</li>");
		} else {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='javascript:ajaxPaging(" + pageNo + ",\"" + url + "\")'>다음</a>");
			sb.append("</li>");
		}
		sb.append("</ul>");
		
		return sb.toString();
	}
	
	public static String paging(int totalData, int cPage, int numPerpage, int pageBarSize, String url,
									String searchType, String searchValue) {
		int totalPage = (int) Math.ceil((double) totalData/ numPerpage);
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;
		
		StringBuffer sb = new StringBuffer();
		sb.append("<ul class='pagination justify-content-center pagination-sm' style='margin-top : 50px;'>");
		if(pageNo == 1) {
			sb.append("<li class='page-item disabled'>");
			sb.append("<a class='page-link' href='#'>이전</a>");
			sb.append("</li>");
		} else {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='javascript:ajaxPagingForSearch(" + (pageNo - 1) + ",\"" + url + "\", \"" + searchType + "\",\"" + searchValue + "\")'>이전</a>");
			sb.append("</li>");
		}
		
		while(!(pageNo > pageEnd || pageNo > totalPage)) {
			if(pageNo == cPage) {
				sb.append("<li class='page-item disabled'>");
				sb.append("<a class='page-link' href='#'>" + pageNo + "</a>");
				sb.append("</li>");
			} else {
				sb.append("<li class='page-item'>");
				sb.append("<a class='page-link' href='javascript:ajaxPagingForSearch(" + pageNo + ",\"" + url + "\", \"" + searchType + "\",\"" + searchValue + "\")'>" + pageNo + "</a>");
				sb.append("</li>");
			}
			pageNo++;
		}
		
		if(pageNo > totalPage) {
			sb.append("<li class='page-item disabled'>");
			sb.append("<a class='page-link' href='#'>다음</a>");
			sb.append("</li>");
		} else {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='javascript:ajaxPagingForSearch(" + pageNo + ",\"" + url + "\", \"" + searchType + "\",\"" + searchValue + "\")'>이전</a>");
			sb.append("</li>");
		}
		sb.append("</ul>");
		
		return sb.toString();
	}
	
	public static String paging(int totalData, int cPage, int numPerpage, int pageBarSize) {
		int totalPage = (int) Math.ceil((double) totalData/ numPerpage);
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;
		
		StringBuffer sb = new StringBuffer();
		sb.append("<ul class='pagination justify-content-center pagination-sm' style='margin-top : 50px;'>");
		if(pageNo == 1) {
			sb.append("<li class='page-item disabled'>");
			sb.append("<a class='page-link' href='#'>이전</a>");
			sb.append("</li>");
		} else {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='javascript:searchDetailAction(" + (pageNo - 1) + ")>이전</a>");
			sb.append("</li>");
		}
		
		while(!(pageNo > pageEnd || pageNo > totalPage)) {
			if(pageNo == cPage) {
				sb.append("<li class='page-item disabled'>");
				sb.append("<a class='page-link' href='#'>" + pageNo + "</a>");
				sb.append("</li>");
			} else {
				sb.append("<li class='page-item'>");
				sb.append("<a class='page-link' href='javascript:searchDetailAction(" + pageNo + ")'>" + pageNo + "</a>");
				sb.append("</li>");
			}
			pageNo++;
		}
		
		if(pageNo > totalPage) {
			sb.append("<li class='page-item disabled'>");
			sb.append("<a class='page-link' href='#'>다음</a>");
			sb.append("</li>");
		} else {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='javascript:searchDetailAction(" + pageNo + ")'>다음</a>");
			sb.append("</li>");
		}
		sb.append("</ul>");
		
		return sb.toString();
	}
	
	//부서관리 뷰
	@GetMapping("/departmentview.do")
	public String departmentManageView(Model model) {
		List<Department> departmentList = getDepartmentList();
		List<Department> teamList = getTeamList();
		
		System.out.println("departmentList : " + departmentList);
		System.out.println("teamList : " + teamList);
		
		Department noDept = new Department("D1", "D1", "부서없음");
		departmentList.add(noDept);
		System.out.println("newDepartmentList : " + departmentList);
		model.addAttribute("depts", departmentList);
		model.addAttribute("teams", teamList);
		
		return "empmanage/departmentmanage";
	}
	
	//팀관리 뷰
	@GetMapping("/teammanageview.do")
	public String teamManageView(Model model) {
		List<Department> departmentList = getDepartmentList();
		List<Department> teamList = getTeamList();
		
		Department noDept = new Department("D1", "D1", "부서없음");
		departmentList.add(noDept);
		
		System.out.println("newDepartmentList : " + departmentList);
		System.out.println("teamList : " + teamList);
		
		model.addAttribute("depts", departmentList);
		model.addAttribute("teams", teamList);
		
		return "empmanage/teammanage";
	}
	
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
				
		int totalData = service.getEmployeesTotalData();
		int pageBarSize = 5;
		int cPage = 1;
		int numPerpage = 5;
		String url = "/manage/joinempInfo.do";
		String pageBar = paging(totalData, cPage, numPerpage, pageBarSize, url);
		
		Map<String, Integer> pagingParam = Map.of("cPage", cPage, "numPerpage", numPerpage);
		Map<String, String> sqlParam = Map.of("sortdata", "name", "sort", "asc");
		List<Employee> employeeInfoList = service.getEmployees(pagingParam, sqlParam);
		employeeInfoList = setEmpFieldTeamName(setEmpFieldDeptName(employeeInfoList));
		
		System.out.println("setting후 employee : " + employeeInfoList);
		
		model.addAttribute("employees", employeeInfoList);
		model.addAttribute("depts", departmentList);
		model.addAttribute("pageBar", pageBar);
		
		return "empmanage/managemain";
	}
	
	@GetMapping("/joinempInfo.do")
	public String joinEmpInfo(Model model, 
			@RequestParam(defaultValue = "1") int cPage, @RequestParam(defaultValue="5") int numPerpage,
			@RequestParam(defaultValue = "name") String sortdata, @RequestParam(defaultValue = "asc") String sort) {
		System.out.println("checkParam : sortdata = " + sortdata + " sort = " + sort);
		int totalData = service.getEmployeesTotalData();
		int pageBarSize = 5;
		String url = "/manage/joinempInfo.do";
		String pageBar = paging(totalData, cPage, numPerpage, pageBarSize, url);
		
		Map<String, Integer> pagingParam = Map.of("cPage", cPage, "numPerpage", numPerpage);
		Map<String, String> sqlParam = Map.of("sortdata", sortdata, "sort", sort);
		
		List<Employee> employeeInfoList = service.getEmployees(pagingParam, sqlParam);
		employeeInfoList = setEmpFieldTeamName(setEmpFieldDeptName(employeeInfoList));
		
		model.addAttribute("employees", employeeInfoList);
		model.addAttribute("pageBar", pageBar);
		
		return "empmanage/responsepage/empinfolist";
	}
	
	@PostMapping("/searchemployee.do")
	public String searchEmployee(@RequestBody Map<String, Object> param, Model model) {
		String searchType = (String) param.get("searchType");
		String modifySearchType = "";
		if(searchType.contains("[")) {
			modifySearchType = searchType.substring(1, searchType.length() - 1);
			param.put("searchType", modifySearchType);
		} else {
			modifySearchType = searchType;
		}
		
		String searchValue = (String) param.get("searchValue");
		int cPage = 1;
		if(param.containsKey("cPage")) {
			cPage = (int) param.get("cPage");
		}
		int numPerpage = Integer.parseInt((String) param.get("numPerpage")); 
		int totalData = service.getEmpListBySearchTotalData(param);
		int pageBarSize = 5;
		String url = "/manage/searchemployee.do";
		String pageBar = paging(totalData, cPage, numPerpage, pageBarSize, url, modifySearchType, searchValue);
		Map<String, Integer> pagingParam = Map.of("cPage", cPage, "numPerpage", numPerpage);
		
		List<Employee> searchEmpList = service.searchEmployee(param, pagingParam);
		searchEmpList = setEmpFieldTeamName(setEmpFieldDeptName(searchEmpList));
		System.out.println("searchEmpList : " + searchEmpList);
		
		model.addAttribute("employees", searchEmpList);
		model.addAttribute("pageBar", pageBar);

		return "empmanage/responsepage/empinfolist";
	}
	
	//살려줘유
	@PostMapping("/detailempsearch.do")
	public String empDetailSearch(@RequestBody Map<String, Object> param) {
		int cPage = (int) param.get("cPage");
		int numPerpage = Integer.parseInt((String) param.get("numPerpage"));
		int totalData = service.empDetailSearchTotalData(param);
		int pageBarSize = 5;
		String pageBar = paging(totalData, cPage, numPerpage, pageBarSize);
		Map<String, Integer> pagingParam = Map.of("cPage", cPage, "numPerpage", numPerpage);
		
		//List<Employee> searchEmpList = service.empDetailSearch(param, pagingParam);
		if(((String) param.get("empName")).equals("")) {
			System.out.println("이게맞아용~");
		}
		
		return null;
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
		
		String initialPwd = "0000";
		String userId = engName;
		emp.setEmpId(userId);
		
		
		String encryptionPwd = encoder.encode(initialPwd);
		
		String gender = "";
		if(emp.getEmpGender().equals("m")) {
			gender = "남성";
		} else {
			gender = "여성";
		}
		emp.setEmpEmail(engName + "@waait.com");
		emp.setEmpPwd(encryptionPwd);
		emp.setEmpGender(gender);
		
		if(deptCode.equals("noDept") && teamCode.equals("noTeam")) {
			emp.setDeptCode("D1");
		} else if(deptCode.equals("noDept")) {
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
		
		int result = 0;
		result = service.enrollEmployee(emp);
		userId += emp.getEmpNo();
		
//		try {
//			//emailService.sendInitialIdAndPwd(usingEmail, userId, initialPwd);
//		} catch (UnsupportedEncodingException e) {
//			e.printStackTrace();
//		} catch (MessagingException e) {
//			e.printStackTrace();
//		}
		System.out.println("등록할 사원정보 : " + emp);
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
	
	@PostMapping("/enrolldepartment.do")
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
	
	@PostMapping("/modifydeptname.do")
	public String modifyDeptName(String deptCode, String deptName, Model model) {
		int result = 0;
		Map<String, String> sqlParam = Map.of("deptCode", deptCode, "deptName", deptName);
		result = service.modifyDeptName(sqlParam);
		return "empmanage/responsepage/deptlist";
	}
	
	@PostMapping("/deletedept.do")
	public ResponseEntity<String> deleteDept(String deptCode) {
		int empCountByDeptCode = service.getEmpCountByDeptCode(deptCode);
		if(empCountByDeptCode > 0) {
			return new ResponseEntity<String>("해당 부서의 사원이 없어야 삭제가 가능합니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		} else {
			int result = 0;
			result = service.deleteDept(deptCode);
			if(result > 0) return new ResponseEntity<String>("부서가 성공적으로 삭제되었습니다.", HttpStatus.OK);
			else return new ResponseEntity<String>("알 수 없는 오류로 삭제에 실패했습니다.", HttpStatus.INTERNAL_SERVER_ERROR);
		}
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
		jsonParam.put("newTeamCodeNumber", existDeptCode.get(0) + 1);
		
		result = service.enrollTeam(jsonParam);
		
		return result;
	}
	
	@PostMapping("/checkduplicateteamname.do")
	public int checkDuplicateTeamName(String modifyName) {
		int checkDuplicationNum = service.checkDuplication(modifyName + "팀");
		System.out.println("check중복 : " + checkDuplicationNum);
		return checkDuplicationNum;
	}
	
	@PostMapping("/modifyteamname.do")
	public String modifyTeamName(String teamCode, String modifyName, Model model) {
		int result = 0;
		
		Map<String, String> sqlParam = Map.of("teamCode", teamCode, "modifyName", modifyName + "팀");
		result = service.modifyTeamName(sqlParam);
		
		List<Department> departmentList = getDepartmentList();
		List<Department> teamList = getTeamList();
		
		Department noDept = new Department("D1", "D1", "부서없음");
		departmentList.add(noDept);
		
		model.addAttribute("depts", departmentList);
		model.addAttribute("teams", teamList);
		
		return "empmanage/responsepage/newdeptteamtable";
	}
	
	
	public List<Employee> setEmpFieldDeptName(List<Employee> employeeList) {
		//List<Employee> employeeList = service.getEmployees();
		List<Department> departmentList = getDepartmentList();

		for(Employee e : employeeList) {
			if(e.getDepartment().getDeptCode() != "D1"
					&& e.getDepartment().getParentCode().equals("D1")) {
				e.setDeptName("부서없음");
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
	
	public List<Employee> setEmpFieldTeamName(List<Employee> employeeList) {
		List<Department> departmentList = getDepartmentList();
		
		employeeList.forEach(emp -> {
			departmentList.forEach(dept -> {
				if(emp.getDepartment().getDeptCode().equals(dept.getDeptCode())) {
					emp.setTeamName("팀 없음");
				}
			});
			if(emp.getTeamName() == null) {
				emp.setTeamName(emp.getDepartment().getDeptName());
			}
			if(emp.getDepartment().getDeptCode().equals("D1")) {
				emp.setTeamName("팀 없음");
			}
			
		});
		
		return employeeList;
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
