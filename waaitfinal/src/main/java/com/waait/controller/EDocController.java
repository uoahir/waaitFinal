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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.waait.dto.AbstractDocument;
import com.waait.dto.Approval;
import com.waait.dto.BasicDocument;
import com.waait.dto.Department;
import com.waait.dto.Employee;
import com.waait.dto.OffDocument;
import com.waait.dto.TripDocument;
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
	
	public final static String RESULT_CODE_SUCCESS = "success";
	public final static String RESULT_CODE_FAIL = "fail";
	public final static int CODE_SUCCESS = 1;
	public final static int CODE_FAIL = -1;
	
	@GetMapping("/basicedoc")
	public void basicEdoc(@RequestParam String type,Model m) {
		System.out.println(type);
		m.addAttribute("type", type);
	}
	@GetMapping("/offedoc")
	public void offEdoc(@RequestParam String type,Model m) {
		System.out.println(type);
		m.addAttribute("type", type);
	}
	
	@PostMapping("/offedocend")
	public String insertOff(@RequestBody OffDocument offDocument) {
		long docWriter = getEmployeeH().getEmpNo();
		System.out.println(offDocument);
		OffDocument doc;
		int vacaCount = getEmployeeH().getRemainingAnnualLeave();
		System.out.println(vacaCount);
		int vacaUsed = offDocument.getVacaUsed();
		int empNo = offDocument.getDocWriter();
		String vacaType = offDocument.getVacaType();
		int vacaLeft = vacaCount - vacaUsed;
		System.out.println(vacaLeft);
		System.out.println(vacaUsed);
		
		try {
			Map<String, Object> param = new HashMap<>();
			param.put("vacaCount", vacaCount);
			param.put("empNo", empNo);
			param.put("vacaUsed", vacaUsed);
			param.put("vacaType", vacaType);
			param.put("vacaLeft", vacaLeft);
			param.put("docWriter", docWriter);
			
			service.insertOffEdoc(offDocument, offDocument.getEmpNo(), param);
			
		} catch(RuntimeException e) {
			e.printStackTrace();
		}
		
		return "redirect:/edoc/home";
	}

	@PostMapping("/basicedocend")
	public String insertBasic(@RequestParam("empNo") int[] empNo, @RequestPart(value="obj") String obj, @RequestPart(value="file", required=false) List<MultipartFile> uploadFiles, HttpSession session) {
	// required = false : 파일 첨부가 필수가 아닌 선택, value = "file" : MultipartFile 요청에서 input[name='file'] 추출
		System.out.println("안녕");
		BasicDocument doc;
		

		try {
//			// json 형태의 문자열로 받아온 obj를 객체화
			ObjectMapper objectMapper = new ObjectMapper();
			doc = objectMapper.readValue(obj, BasicDocument.class);
			
			
			System.out.println(doc.getDocType());
			
			service.insertBasicEdoc(doc, empNo);
		
			System.out.println(empNo.length);
			
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
	    return "redirect:/edoc/home";
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
	
	@RequestMapping("/home")
	public String home(Model m, @RequestParam(defaultValue = "1") int cPage,
	         @RequestParam(defaultValue = "10") int numPerpage) {
		Long no = getEmployeeH().getEmpNo(); //  로그인된 empNo !!! 
		
//		승인 대기 중인 문서 출력
		List<AbstractDocument> documents = service.awaitingApproval(no, Map.of("cPage", cPage, "numPerpage", numPerpage));
		m.addAttribute("documents", documents);
		
		return "edoc/home";
	}
	
	@RequestMapping("/inprogress")
	public String inprogress(Model m
					, @RequestParam(defaultValue ="1") int cPage
					, @RequestParam(defaultValue="10") int numPerpage) {
		Long no = getEmployeeH().getEmpNo();
		
//		진행 중인 문서 출력
		List<AbstractDocument> documents = service.inprogressDocument(no, Map.of("cPage", cPage, "numPerpage", numPerpage));
		m.addAttribute("documents", documents);
		
		return "edoc/inprogress";
	}
	
	@RequestMapping("/approved")
	public String approved(Model m
			, @RequestParam(defaultValue ="1") int cPage
			, @RequestParam(defaultValue="10") int numPerpage) {
		Long no = getEmployeeH().getEmpNo();
		
//		승인완료된 문서 출력 (docWriter 가 로그인된 empNo와 같고, docStatus 가 '승인')
		List<AbstractDocument> documents = service.approvedDocument(no, Map.of("cPage", cPage, "numPerpage", numPerpage));
		m.addAttribute("documents", documents);
		
		return "edoc/approved";
	}
	
	@GetMapping("/selectdoc")
	public void selectDoc() {}
	
	public Employee getEmployeeH() {
		return (Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}
	
	@GetMapping("/openedoc{docId}/{docType}/{docWriter}") 
	public String openEdoc(@PathVariable int docId, @PathVariable String docType, @PathVariable Long docWriter, Model m) {
		Long empNo = getEmployeeH().getEmpNo();
		String page=""; 
		String tableName="";
		switch(docType) {
			case "T01": tableName = "basic_form"; page="edoc/openbasic"; break;
			case "T02": tableName = ""; break;
			case "T03": tableName = "trip_form"; page="edoc/opentrip"; break;
			case "T04": tableName = "off_form"; page="edoc/openbasic"; break;
		} // 문서유형에 따라, 조인되는 tableName 과 jsp 페이지를 매칭
		AbstractDocument doc = service.selectDocumentById(docId); // 문서유형과는 상관 없음

		if(empNo != docWriter && doc.getIsFirstOpened()==0) {
			service.updateFirstOpened(docId);
			// 처음 열었을 때만, 문서 상태 update ! docStatus, isFirstOpened
			// getIsFirstOpened == 0 일 때만 실행되고, 1일 때는 update 가 실행되지 않음
		}
		
		// 문서정보가져와서 담아주기 ~ 
		Map<String,Object> param = new HashMap<>();
		param.put("docId", docId);
		param.put("tableName", tableName);
		param.put("docType", docType);		
		AbstractDocument abdocument = service.selectDocumentDetail(param);
		
		List<Approval> approvals = service.selectApprovalByDocId(docId);
		System.out.println(approvals + "요겅!");
		
		if(approvals.size()>0) {
			abdocument.setApprovals(approvals);
		}
		
		if(abdocument instanceof BasicDocument) {
			BasicDocument document = (BasicDocument)abdocument;
			m.addAttribute("document", document);
			System.out.println("얘 ! ! : " + document.getDocNumber());
		} else if(abdocument instanceof TripDocument) {
			TripDocument document = (TripDocument)abdocument;
			m.addAttribute("document", document);
		} else if(abdocument instanceof OffDocument) {
			OffDocument document = (OffDocument)abdocument;
			m.addAttribute("document", document);
		} 
	
		return page;
	}
	
	@ResponseBody
	@PostMapping("/approval")  // 승인을 구분해줘야 함 -> 기본보고서 || 휴가신청 중간결재까지는 똑같고 최종승인에서 변경됨 !!!! 
	public ResponseEntity<List<Approval>> approval(@RequestBody BasicDocument doc) throws JsonMappingException, JsonProcessingException {
		
		int docId = doc.getDocId();
		int finalOrder = doc.getRnum(); // approval 의 사이즈를 rnum에다가 담아준 거임 == 최종결재자 번호임 
		String docType = doc.getDocType();
		int writer = doc.getDocWriter();
		
		// document 랑 approval 이랑 join where docId = #{docId} and  했을 때, appOrder 가지고와서 비교 !   
		// login 한 아이디가 필요함 !!!! appEmp == loginedEmpNo -> getAppOrder 
		long empNo = getEmployeeH().getEmpNo();
		
		Map<String,Object> param = new HashMap<>();
		param.put("docId", docId);
		param.put("empNo", empNo);
		param.put("docType", docType);
		param.put("writer", writer);
		
		Approval app = service.selectApprovalByDocIdAndEmpNo(param);
		
		int appOrder = app.getAppOrder();
		param.put("appOrder", appOrder);
		System.out.println(appOrder + " " + finalOrder);
		if(appOrder!=finalOrder) {
			// 최종결재자가 아닌, 중간결재자 
			// approval 테이블에서 appStat 승인전 -> 승인 변경
			// document 현재결재자 -> 현재 appOrder + 1 한 값의 appEmp 로 update ~ ! 
			// docId, empNo를 넘겨줘서 ~,, 로그인한 empNo 와 appEmp 가 같고, docId 가 같은, approval 행을 찾아서 appStat 을 승인으로 변경해주고
			// docId 에 있는 현재결재자 (approval) appOrder가 현재결재자 기준 appOrder + 1인 결재자를 찾아서 ! update ! 서브쿼리문 ?!?!
			service.updateApproval(param);
			
		} else {
			// 최종결재자 !!! 
			// 해당 docId, login된 empNo를 가지고, appStat을 승인, document table docstat 을 승인으로 변경	
			int result = service.updateFinalApproval(param);
		}
		
		return ResponseEntity.ok(service.selectApprovalByDocId(doc.getDocId()));
	}
	
	@ResponseBody
	@GetMapping("/offcheck")
	public List<OffDocument> offcheck(){
		Long empNo = getEmployeeH().getEmpNo();
		List<OffDocument> data = service.getOffDocumentList(empNo);
		return data;
	}
	
	@ResponseBody
	@GetMapping("/remaining")
	public String remainingOff() {
		Long empNo = getEmployeeH().getEmpNo();
		int result = service.getRemainingOff(empNo);
		String result2 = String.valueOf(result);
		System.out.println(result2);
		return result2;
	}
	
	@ResponseBody
	@GetMapping("/docwriter")
	public Employee getWriter() {
		Long empNo = getEmployeeH().getEmpNo();
		Employee emp = service.getWriter(empNo);
		System.out.println("화긴" + emp);
		return emp;
	}
	
}
