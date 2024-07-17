package com.waait.controller;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.waait.dto.Approval;
import com.waait.dto.Department;
import com.waait.dto.Type;
import com.waait.dto.Document;
import com.waait.dto.Employee;
import com.waait.service.EDocService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/edoc")
@RequiredArgsConstructor
public class EDocController {
	
	private final EDocService service;
	
	@GetMapping("/basicedoc")
	public void basicEdoc(@RequestParam String type,Model m) {
		System.out.println(type);
		m.addAttribute("type", type);
	}
	
	@PostMapping("/basicedocend")
	public String insertBasic(@RequestParam("empNo") int[] empNo, @RequestPart(value="obj") String obj, @RequestPart(value="file", required=false) List<MultipartFile> uploadFiles, HttpSession session) {
	// required = false : 파일 첨부가 필수가 아닌 선택, value = "file" : MultipartFile 요청에서 input[name='file'] 추출
		System.out.println("안녕");
		Document doc;

		try {
			// json 형태의 문자열로 받아온 obj를 객체화
			ObjectMapper objectMapper = new ObjectMapper();
			doc = objectMapper.readValue(obj, Document.class); 
			
			
			int result = service.insertBasicEdoc(doc, empNo);
			System.out.println(empNo.length);
			System.out.println(result);
			
			// 파일 업로드 처리
			
	        if (uploadFiles != null && !uploadFiles.isEmpty()) {
	        	String uploadDir = session.getServletContext().getRealPath("resouces/upload/edoc");
	            for (MultipartFile file : uploadFiles) {
	                // 파일 저장 로직 추가 (예: file.transferTo(new File("/path/to/save")))
	            	if(!file.isEmpty()) {
	            		String oriFileName = file.getOriginalFilename();
						String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
	            		String renamedFileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename()+ext;
	            		
	            		String filePath = uploadDir + File.separator + renamedFileName;
	            		
	            		// 파일 저장
	            		Path path = Paths.get(filePath);
	            		Files.write(path, file.getBytes());
	            	}
	            }
	        }
	    } catch (RuntimeException e) {
	        log.error("JSON 파싱 오류", e);
	        return "redirect:/edoc/basicedoc?error=json";
	    } catch (Exception e) {
	        log.error("파일 처리 오류", e);
	        return "redirect:/edoc/basicedoc?error=file";
	    }
	    return "redirect:/edoc/basicedoc";
	}
	
	@GetMapping("/appline")
	public void appline(Model m) {
		List<Employee> employees = service.employeeList();
		m.addAttribute("employees", employees);
		List<Department> departments = service.deptList();
		System.out.println(departments.size());
		m.addAttribute("departments", departments);
	}
	
	@GetMapping("/appline2") // jstree
	public void appline2(Model m) {
		List<Employee> employees = service.employeeList();
		m.addAttribute("employees", employees);
	}
	
	@GetMapping("/home")
	public void home(Model m, @RequestParam(defaultValue = "1") int cPage,
	         @RequestParam(defaultValue = "10") int numPerpage) {
		Long no = getEmployeeH().getEmpNo();
		
//		승인 대기 중인 문서 출력
		List<Document> documents = service.awaitingApproval(no, Map.of("cPage", cPage, "numPerpage", numPerpage));
		m.addAttribute("documents", documents);
	}
	
	@GetMapping("/selectdoc")
	public void selectDoc() {}
	
	public Employee getEmployeeH() {
		return (Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}
	
	@GetMapping("/openedoc{docId}/{docType}") 
	public String openEdoc(@PathVariable int docId, @PathVariable String docType, Model m) {
		
		String page=""; 
		String tableName="";
		switch(docType) {
			case "T01": tableName = "basic_form"; page="edoc/openbasic"; break;
			case "T02": tableName = ""; break;
			case "T03": tableName = "trip_form"; page="edoc/opentrip"; break;
			case "T04": tableName = "off_form"; page="edoc/openoff"; break;
		}
		Document doc = service.selectDocumentById(docId);
		if(doc.getIsFirstOpened()==0) {
			service.updateFirstOpened(docId);
			// 처음 열었을 때만, 문서 상태 update ! docStatus, isFirstOpened
		}
		
		// 문서정보가져와서 담아주기 ~ 
		Map<String,Object> param = new HashMap<>();
		param.put("docId", docId);
		param.put("tableName", tableName);
		
		Document document = service.selectDocumentDetail(param);
			
		List<Approval> approvals = service.selectApprovalByDocId(docId);
		System.out.println(approvals + "요겅!");
		
		if(approvals.size()>0) {
			document.setApprovals(approvals);
		}
		
		System.out.println(document);
		
		m.addAttribute("document", document);
	
		return page;
	}
	
	
	@PostMapping("/approval")
	public ResponseEntity<List<Approval>> approval(int docId) {
		return ResponseEntity.ok(service.selectApprovalByDocId(docId));
	}
	
}
