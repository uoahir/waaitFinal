package com.waait.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

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
import com.waait.service.EmployeeManagementService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/manage")
@RequiredArgsConstructor
public class EmployeeManagementController {
	
	private final EmployeeManagementService service;
	
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
	public String enrollEmployee(@ModelAttribute Employee emp, MultipartFile profile,
									MultipartFile signfile, HttpSession session) {
		String signfilePath = session.getServletContext().getRealPath("/resources/upload/emp/signfile/");
		String profilePath = session.getServletContext().getRealPath("/resources/upload/emp/profile/");
		System.out.println("등록하려는 사원정보 : " + emp);
		
		if(profile != null) {
			System.out.println("profile originalName : " + profile.getOriginalFilename());
			String oriName = profile.getOriginalFilename();
			String ext = oriName.substring(oriName.lastIndexOf("."));
			Date now = new Date(System.currentTimeMillis());
			int randomNum = (int) (Math.random() * 10000) + 1;
			String rename = "employeeprofile" + (new SimpleDateFormat("yyyyMMdd_HHmmssSSS").format(now)) + "_"
								+ randomNum + ext;
			
			
			File dirProfile = new File(profilePath);
			if(!dirProfile.exists()) dirProfile.mkdirs();
			
			try {
				signfile.transferTo(new File(profilePath, rename));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		if(signfile != null) {
			System.out.println("signFile originalName : " + signfile.getOriginalFilename());
			String oriName = profile.getOriginalFilename();
			String ext = oriName.substring(oriName.lastIndexOf("."));
			Date now = new Date(System.currentTimeMillis());
			int randomNum = (int) (Math.random() * 10000) + 1;
			String rename = "employeesignfile" + (new SimpleDateFormat("yyyyMMdd_HHmmssSSS").format(now)) + "_"
								+ randomNum + ext;
			
			
			File dirSignFile = new File(signfilePath);
			if(!dirSignFile.exists()) dirSignFile.mkdirs();
			
			try {
				signfile.transferTo(new File(signfilePath, rename));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		emp.setEmpEmail(emp.getEmpId() + "@waait.com");
		
		return null;
	}
	
	@PostMapping("/searchempformodifydept.do")
	public @ResponseBody Map<String, Object> searchEmpForModifyDepartment(@RequestBody Map<String, String> searchParam) {
		String empId = searchParam.get("empId");
		String empName = searchParam.get("empName");;
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
	
	@PostMapping("/empmodifydept.do")
	public @ResponseBody int modifyEmployeeDept(String wantModifyDeptName, String wantModifyDeptCode, String wantModifyTeamCode, String empId) {
		int result = 0;
		System.out.println("wantModifyDeptCode : " + wantModifyDeptCode);
		
		Employee emp = service.getEmployeeById(empId);
		
		Map<String, Object> modifyParam = Map.of("wantModifyDeptCode", wantModifyTeamCode, "empId", empId, "empOriInfo", emp);
		result = service.modifyEmployeeDept(modifyParam);
		if(result < 0) return result;
		
		
		
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
