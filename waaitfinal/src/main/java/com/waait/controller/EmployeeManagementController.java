package com.waait.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
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
		List<Department> departmentList = service.getDepartment();
		System.out.println("departmentList : " + departmentList);
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
			String rename = "employeeprofile" +(new SimpleDateFormat("yyyyMMdd_HHmmssSSS").format(now)) + "_"
								+ randomNum + ext;
			
			
			File saveProFile = new File(signfilePath, rename);
			if(!saveProFile.exists()) saveProFile.mkdirs();
			
			try {
				signfile.transferTo(saveProFile);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		if(signfile != null) {
			System.out.println("signFile originalName : " + signfile.getOriginalFilename());
		}
		
		
		
		
		
		
		emp.setEmpEmail(emp.getEmpId() + "@waait.com");
		return null;
	}
}
