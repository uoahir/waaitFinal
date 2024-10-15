package com.waait.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.MediaType;
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
import com.waait.dto.AttatchFile;
import com.waait.dto.BasicDocument;
import com.waait.dto.Department;
import com.waait.dto.Employee;
import com.waait.dto.OffDocument;
import com.waait.dto.TripDocument;
import com.waait.service.EDocService;

import jakarta.servlet.http.HttpServletResponse;
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
	@GetMapping("/offedoc")
	public void offEdoc(@RequestParam String type,Model m) {
		System.out.println(type);
		m.addAttribute("type", type);
	}
	
	@GetMapping("/write2")
	public void writeDocument(@RequestParam String type, Model m) {
		System.out.println(type);
		m.addAttribute("type", type);
		List<Department> depts = service.deptList();
		m.addAttribute("depts", depts);
		List<Employee> employees = service.employeeList();
		m.addAttribute("employees", employees);	
	}
	
	@GetMapping("/write3")
	public void writeDocumentBasic(@RequestParam String type, Model m) {
		System.out.println(type);
		m.addAttribute("type", type);
		List<Department> depts = service.deptList();
		m.addAttribute("depts", depts);
		List<Employee> employees = service.employeeList();
		m.addAttribute("employees", employees);	
	}
	
	@GetMapping("/write4")
	public void writeTrip(@RequestParam String type, Model m) {
		System.out.println(type);
		m.addAttribute("type", type);
		List<Department> depts = service.deptList();
		m.addAttribute("depts", depts);
		List<Employee> employees = service.employeeList();
		m.addAttribute("employees", employees);
	}
	
	@PostMapping(value = "/offedocend",consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE})
	public String insertOff(@RequestPart String data, @RequestPart(value = "files", required = false) List<MultipartFile> files, HttpSession session) throws JsonMappingException, JsonProcessingException {
		ObjectMapper ob = new ObjectMapper();
		OffDocument offDocument = ob.readValue(data, OffDocument.class);
		
		System.out.println("이거 파일들어오는지 볼수잇음" + files);
		
		long docWriter = getEmployeeH().getEmpNo();
		System.out.println(offDocument);
		int vacaCount = getEmployeeH().getRemainingAnnualLeave();
		System.out.println(vacaCount);
		int vacaUsed = offDocument.getVacaUsed();
		int empNo = offDocument.getDocWriter();
		String vacaType = offDocument.getVacaType();
		int vacaLeft = vacaCount - vacaUsed;
		System.out.println(vacaLeft);
		System.out.println(vacaUsed);
		
		System.out.println("이거휴가신청이랑관련"+offDocument);
		
		try {
			Map<String, Object> param = new HashMap<>();
			param.put("vacaCount", vacaCount);
			param.put("empNo", empNo);
			param.put("vacaUsed", vacaUsed);
			param.put("vacaType", vacaType);
			param.put("vacaLeft", vacaLeft);
			param.put("docWriter", docWriter);			
			
			List<AttatchFile> attatchFiles = new ArrayList<>();
			
			String path = session.getServletContext().getRealPath("resources/upload/edoc");
			if (files != null) {
				System.out.println("file은 널이 아님 !! ");
				for (MultipartFile file : files) {
					System.out.println("fileName : " + file.getOriginalFilename());
					if (!file.isEmpty()) {
						String oriName = file.getOriginalFilename();
						String ext = oriName.substring(oriName.lastIndexOf("."));
						Date today = new Date(System.currentTimeMillis());
						int randomVal = (int) (Math.random() * 100000) + 1;
						String rename = "waait" + oriName +(new SimpleDateFormat("yyyyMMdd").format(today)) + "_" + randomVal + ext;
						File dir = new File(path);
						if (!dir.exists()) dir.mkdirs();
						
						AttatchFile attatchFile= AttatchFile
												.builder()
												.originalFilename(oriName)
												.renamedFilename(rename)
												.build();
						
						attatchFiles.add(attatchFile);
						
						try {
							file.transferTo(new File(path, rename));
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
			}
			service.insertOffEdoc(offDocument, offDocument.getEmpNo(), param, attatchFiles);
			
		} catch(RuntimeException e) {
			e.printStackTrace();
		}
		
		return "redirect:/edoc/home";
	}
	@PostMapping(value = "/basicedocend",consumes = {MediaType.APPLICATION_JSON_VALUE, MediaType.MULTIPART_FORM_DATA_VALUE})
	public String insertBasic(@RequestPart String data, @RequestPart(value = "files", required = false) List<MultipartFile> files, HttpSession session) throws JsonMappingException, JsonProcessingException {
		ObjectMapper ob = new ObjectMapper();
		BasicDocument basicDocument = ob.readValue(data, BasicDocument.class);
		
		System.out.println("이거 파일들어오는지 볼수잇음" + files);
		
		long docWriter = getEmployeeH().getEmpNo();
		System.out.println(basicDocument);
		basicDocument.getDocContent();
		int empNo = basicDocument.getDocWriter();

		try {
			Map<String, Object> param = new HashMap<>();
			param.put("empNo", empNo);
			param.put("docWriter", docWriter);			
			
			List<AttatchFile> attatchFiles = new ArrayList<>();
			
			String path = session.getServletContext().getRealPath("resources/upload/edoc");
			if (files != null) {
				System.out.println("file은 널이 아님 !! ");
				for (MultipartFile file : files) {
					System.out.println("fileName : " + file.getOriginalFilename());
					if (!file.isEmpty()) {
						String oriName = file.getOriginalFilename();
						String ext = oriName.substring(oriName.lastIndexOf("."));
						Date today = new Date(System.currentTimeMillis());
						int randomVal = (int) (Math.random() * 100000) + 1;
						String rename = "waait" + oriName +(new SimpleDateFormat("yyyyMMdd").format(today)) + "_" + randomVal + ext;
						File dir = new File(path);
						if (!dir.exists()) dir.mkdirs();
						
						AttatchFile attatchFile= AttatchFile
								.builder()
								.originalFilename(oriName)
								.renamedFilename(rename)
								.build();
						
						attatchFiles.add(attatchFile);
						
						try {
							file.transferTo(new File(path, rename));
						} catch (IOException e) {
							e.printStackTrace();
						}
					}
				}
			}
			service.insertBasicEdoc(basicDocument, basicDocument.getEmpNo(), param, attatchFiles);
			
		} catch(RuntimeException e) {
			e.printStackTrace();
		}
		
		return "redirect:/edoc/home";
	}

//	@PostMapping("/basicedocend")
//	public String insertBasic(@RequestParam("empNo") int[] empNo, @RequestPart(value="obj") String obj, @RequestPart(value="file", required=false) List<MultipartFile> uploadFiles, HttpSession session) {
//	// required = false : 파일 첨부가 필수가 아닌 선택, value = "file" : MultipartFile 요청에서 input[name='file'] 추출
//		System.out.println("안녕");
//		BasicDocument doc;
//		
//
//		try {
////			// json 형태의 문자열로 받아온 obj를 객체화
//			ObjectMapper objectMapper = new ObjectMapper();
//			doc = objectMapper.readValue(obj, BasicDocument.class);
//			
//			
//			System.out.println(doc.getDocType());
//			
//			service.insertBasicEdoc(doc, empNo);
//		
//			System.out.println(empNo.length);
//			
//			// 파일 업로드 처리
//			
//	        if (uploadFiles != null && !uploadFiles.isEmpty()) {
//	        	String uploadDir = session.getServletContext().getRealPath("resouces/upload/edoc");
//	            for (MultipartFile file : uploadFiles) {
//	                // 파일 저장 로직 추가 (예: file.transferTo(new File("/path/to/save")))
//	            	if(!file.isEmpty()) {
//	            		String oriFileName = file.getOriginalFilename();
//						String ext = oriFileName.substring(oriFileName.lastIndexOf("."));
//	            		String renamedFileName = UUID.randomUUID().toString() + "_" + file.getOriginalFilename()+ext;
//	            		
//	            		String filePath = uploadDir + File.separator + renamedFileName;
//	            		
//	            		// 파일 저장
//	            		Path path = Paths.get(filePath);
//	            		Files.write(path, file.getBytes());
//	            	}
//	            }
//	        }
//	    } catch (RuntimeException e) {
//	        log.error("JSON 파싱 오류", e);
//	        return "redirect:/edoc/basicedoc?error=json";
//	    } catch (Exception e) {
//	        log.error("파일 처리 오류", e);
//	        return "redirect:/edoc/basicedoc?error=file";
//	    }
//	    return "redirect:/edoc/home";
//	}
//	
	@GetMapping("/applinelist")
	public void applineList(Model m) {
		List<Department> departments = service.deptList();
		System.out.println(departments.size());
		m.addAttribute("departments", departments);
	}
	
	@ResponseBody
	@GetMapping("/appline")
	public List<Employee> appline(Model m) {
		List<Employee> employees = service.employeeList();

		return employees;
	}
	
	@ResponseBody
	@GetMapping("/appcount")
	public List<Integer> appCount() {
		List<Integer> appCount = new ArrayList<>();
		Long empNo = getEmployeeH().getEmpNo();
		appCount.add(service.awaitingApprovalTotal(empNo));
		appCount.add(service.inprogressCount(empNo));
		
		return appCount;
	}
	
	@GetMapping("/appline2") // jstree
	public void appline2(Model m) {
		List<Employee> employees = service.employeeList();
		m.addAttribute("employees", employees);
	}
	@GetMapping("/nodelist") // nodedata
	public void nodelist(Model m) {
		List<Employee> employees = service.employeeList();
		m.addAttribute("employees", employees);
	}
	
	@RequestMapping("/home")
	public String home(Model m, @RequestParam(defaultValue = "1") int cPage,
	         @RequestParam(defaultValue = "10") int numPerpage) {
		Long no = getEmployeeH().getEmpNo(); //  로그인된 empNo !!! 
		
//		승인 대기 중인 문서 출력
		List<AbstractDocument> documents = service.awaitingApproval(no, Map.of("cPage", cPage, "numPerpage", numPerpage));
		m.addAttribute("waitdocuments", documents);
		
		return "edoc/home";
	}
	
	@RequestMapping("/inprogress")
	public String inprogress(Model m
					, @RequestParam(defaultValue ="1") int cPage1 // 진행중인문서	
					, @RequestParam(defaultValue="10") int numPerpage1
					, @RequestParam(defaultValue="1") int cPage2
					, @RequestParam(defaultValue="10") int numPerpage2) {
		Long no = getEmployeeH().getEmpNo();
		
//		진행 중인 문서 출력
		List<AbstractDocument> documents = service.inprogressDocument(no, Map.of("cPage1", cPage1, "numPerpage1", numPerpage1));
		m.addAttribute("documents", documents);
		
		int totalData = service.inprogressCount(no); // 진행중인 문서 개수 뽑아오기 !!! 
		int totalPage = (int) Math.ceil((double) totalData / numPerpage1);
		int pageBarSize = 5;
		int pageNo = ((cPage1 - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;
		String url = "/GDJ79_WAAIT_final/edoc/inprogress";

		StringBuffer sb = new StringBuffer();
		sb.append("<ul class='pagination justify-content-center pagination-sm'>");
		if (pageNo == 1) {
			sb.append("<li class='page-item disabled'>");
			sb.append("<a class='page-link' href='#'>이전</a>");
			sb.append("</li>");
		} else {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='javascript:fn_paging(" + (pageNo - 1) + ")'>이전</a>");
			sb.append("</li>");
		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage1) {
				sb.append("<li class='page-item disabled'>");
				sb.append("<a class='page-link' href='#'>" + pageNo + "</a>");
				sb.append("</li>");
			} else {
				sb.append("<li class='page-item'>");
				sb.append("<a class='page-link' href='javascript:fn_paging(" + pageNo + ")'>" + pageNo + "</a>");
				sb.append("</li>");
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			sb.append("<li class='page-item disabled'>");
			sb.append("<a class='page-link' href='#'>다음</a>");
			sb.append("</li>");
		} else {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='javascript:fn_paging(" + pageNo + ")'>다음</a>");
			sb.append("</li>");
		}
		sb.append("</ul>");

		sb.append("<script>");
		sb.append("function fn_paging(pageNo) {");
		sb.append("location.assign('" + url + "?cPage1='+pageNo+'&numPerpage1=" + numPerpage1 + "')");
		sb.append("}");
		sb.append("</script>");

		m.addAttribute("pageBar1", sb.toString());
		
//		승인대기중인 문서 	

		int totalData1 = service.awaitingApprovalTotal(no); // 승인대기중인 문서 개수 뽑아오기 !!! 
		int totalPage1 = (int) Math.ceil((double) totalData1 / numPerpage2);
		int pageBarSize1 = 5;
		int pageNo1 = ((cPage2 - 1) / pageBarSize1) * pageBarSize1 + 1;
		int pageEnd1 = pageNo1 + pageBarSize1 - 1;
		String url1 = "/GDJ79_WAAIT_final/edoc/inprogress";
		
		StringBuffer sb1 = new StringBuffer();
		sb1.append("<ul class='pagination justify-content-center pagination-sm'>");
		if (pageNo1 == 1) {
			sb1.append("<li class='page-item disabled'>");
			sb1.append("<a class='page-link' href='#'>이전</a>");
			sb1.append("</li>");
		} else {
			sb1.append("<li class='page-item'>");
			sb1.append("<a class='page-link' href='javascript:fn_paging1(" + (pageNo1 - 1) + ")'>이전</a>");
			sb1.append("</li>");
		}
		
		while (!(pageNo1 > pageEnd1 || pageNo1 > totalPage1)) {
			if (pageNo1 == cPage1) {
				sb1.append("<li class='page-item disabled'>");
				sb1.append("<a class='page-link' href='#'>" + pageNo1 + "</a>");
				sb1.append("</li>");
			} else {
				sb1.append("<li class='page-item'>");
				sb1.append("<a class='page-link' href='javascript:fn_paging1(" + pageNo1 + ")'>" + pageNo1 + "</a>");
				sb1.append("</li>");
			}
			pageNo1++;
		}
		
		if (pageNo1 > totalPage1) {
			sb1.append("<li class='page-item disabled'>");
			sb1.append("<a class='page-link' href='#'>다음</a>");
			sb1.append("</li>");
		} else {
			sb1.append("<li class='page-item'>");
			sb1.append("<a class='page-link' href='javascript:fn_paging1(" + pageNo1 + ")'>다음</a>");
			sb1.append("</li>");
		}
		sb1.append("</ul>");
		
		sb1.append("<script>");
		sb1.append("function fn_paging1(pageNo1) {");
		sb1.append("location.assign('" + url1 + "?cPage2='+pageNo1+'&numPerpage2=" + numPerpage2 + "')");
		sb1.append("}");
		sb1.append("</script>");
		
		m.addAttribute("pageBar2", sb1.toString());
		
		
		List<AbstractDocument> waitdocuments = service.awaitingApproval(no, Map.of("cPage2", cPage2, "numPerpage2", numPerpage2));
		m.addAttribute("waitdocuments", waitdocuments);
		
		
		
		
		return "edoc/inprogress";
	}
	@RequestMapping("/rejected")
	public String rejected(Model m
			, @RequestParam(defaultValue ="1") int cPage
			, @RequestParam(defaultValue="10") int numPerpage) {
		Long no = getEmployeeH().getEmpNo();
		
//		반려당한 문서 출력
		List<AbstractDocument> documents = service.rejectedDocument(no, Map.of("cPage", cPage, "numPerpage", numPerpage));
		m.addAttribute("documents", documents);
		System.out.println(documents);
		
		return "edoc/rejected";
	}
	
	@RequestMapping("/approved")
	public String approved(Model m
			, @RequestParam(defaultValue ="1") int cPage
			, @RequestParam(defaultValue="10") int numPerpage) {
		Long no = getEmployeeH().getEmpNo();
		
//		승인완료된 문서 출력 (docWriter 가 로그인된 empNo와 같고, docStatus 가 '승인')
		List<AbstractDocument> documents = service.approvedDocument(no, Map.of("cPage", cPage, "numPerpage", numPerpage));
		m.addAttribute("documents", documents);
		
		int totalData = service.approvedCount(no); // 진행중인 문서 개수 뽑아오기 !!! 
		int totalPage = (int) Math.ceil((double) totalData / numPerpage);
		int pageBarSize = 5;
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;
		String url = "/GDJ79_WAAIT_final/edoc/inprogress";

		StringBuffer sb = new StringBuffer();
		sb.append("<ul class='pagination justify-content-center pagination-sm'>");
		if (pageNo == 1) {
			sb.append("<li class='page-item disabled'>");
			sb.append("<a class='page-link' href='#'>이전</a>");
			sb.append("</li>");
		} else {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='javascript:fn_paging(" + (pageNo - 1) + ")'>이전</a>");
			sb.append("</li>");
		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				sb.append("<li class='page-item disabled'>");
				sb.append("<a class='page-link' href='#'>" + pageNo + "</a>");
				sb.append("</li>");
			} else {
				sb.append("<li class='page-item'>");
				sb.append("<a class='page-link' href='javascript:fn_paging(" + pageNo + ")'>" + pageNo + "</a>");
				sb.append("</li>");
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			sb.append("<li class='page-item disabled'>");
			sb.append("<a class='page-link' href='#'>다음</a>");
			sb.append("</li>");
		} else {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='javascript:fn_paging(" + pageNo + ")'>다음</a>");
			sb.append("</li>");
		}
		sb.append("</ul>");

		sb.append("<script>");
		sb.append("function fn_paging(pageNo) {");
		sb.append("location.assign('" + url + "?cPage='+pageNo+'&numPerpage=" + numPerpage + "')");
		sb.append("}");
		sb.append("</script>");

		m.addAttribute("pageBar1", sb.toString());
		
		
		
		return "edoc/approved";
	}
	@RequestMapping("/approvedall")
	public String approvedall(Model m
			, @RequestParam(defaultValue ="1") int cPage
			, @RequestParam(defaultValue="10") int numPerpage) {
		
//		승인완료된 문서 출력 (docWriter 가 로그인된 empNo와 같고, docStatus 가 '승인')
		List<AbstractDocument> documents = service.approvedAllDocument(Map.of("cPage", cPage, "numPerpage", numPerpage));
		m.addAttribute("documents", documents);
		
		int totalData = service.approvedAllCount(); // 완료된 문서 !!! 
		int totalPage = (int) Math.ceil((double) totalData / numPerpage);
		int pageBarSize = 5;
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;
		String url = "/GDJ79_WAAIT_final/edoc/inprogress";

		StringBuffer sb = new StringBuffer();
		sb.append("<ul class='pagination justify-content-center pagination-sm'>");
		if (pageNo == 1) {
			sb.append("<li class='page-item disabled'>");
			sb.append("<a class='page-link' href='#'>이전</a>");
			sb.append("</li>");
		} else {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='javascript:fn_paging(" + (pageNo - 1) + ")'>이전</a>");
			sb.append("</li>");
		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				sb.append("<li class='page-item disabled'>");
				sb.append("<a class='page-link' href='#'>" + pageNo + "</a>");
				sb.append("</li>");
			} else {
				sb.append("<li class='page-item'>");
				sb.append("<a class='page-link' href='javascript:fn_paging(" + pageNo + ")'>" + pageNo + "</a>");
				sb.append("</li>");
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			sb.append("<li class='page-item disabled'>");
			sb.append("<a class='page-link' href='#'>다음</a>");
			sb.append("</li>");
		} else {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='javascript:fn_paging(" + pageNo + ")'>다음</a>");
			sb.append("</li>");
		}
		sb.append("</ul>");

		sb.append("<script>");
		sb.append("function fn_paging(pageNo) {");
		sb.append("location.assign('" + url + "?cPage='+pageNo+'&numPerpage=" + numPerpage + "')");
		sb.append("}");
		sb.append("</script>");

		m.addAttribute("pageBar1", sb.toString());
		
		return "edoc/approvedall";
	}
	
	@RequestMapping("/saved")
	public String saved(Model m
			, @RequestParam(defaultValue ="1") int cPage
			, @RequestParam(defaultValue="10") int numPerpage) {
		Long no = getEmployeeH().getEmpNo();
		
		List<AbstractDocument> documents = service.savedDocument(no, Map.of("cPage", cPage, "numPerpage", numPerpage));
		m.addAttribute("documents", documents);
		
		int totalData = service.savedDocumentCount(no); // 진행중인 문서 개수 뽑아오기 !!! 
		int totalPage = (int) Math.ceil((double) totalData / numPerpage);
		int pageBarSize = 5;
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;
		String url = "/GDJ79_WAAIT_final/edoc/inprogress";

		StringBuffer sb = new StringBuffer();
		sb.append("<ul class='pagination justify-content-center pagination-sm'>");
		if (pageNo == 1) {
			sb.append("<li class='page-item disabled'>");
			sb.append("<a class='page-link' href='#'>이전</a>");
			sb.append("</li>");
		} else {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='javascript:fn_paging(" + (pageNo - 1) + ")'>이전</a>");
			sb.append("</li>");
		}

		while (!(pageNo > pageEnd || pageNo > totalPage)) {
			if (pageNo == cPage) {
				sb.append("<li class='page-item disabled'>");
				sb.append("<a class='page-link' href='#'>" + pageNo + "</a>");
				sb.append("</li>");
			} else {
				sb.append("<li class='page-item'>");
				sb.append("<a class='page-link' href='javascript:fn_paging(" + pageNo + ")'>" + pageNo + "</a>");
				sb.append("</li>");
			}
			pageNo++;
		}

		if (pageNo > totalPage) {
			sb.append("<li class='page-item disabled'>");
			sb.append("<a class='page-link' href='#'>다음</a>");
			sb.append("</li>");
		} else {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='javascript:fn_paging(" + pageNo + ")'>다음</a>");
			sb.append("</li>");
		}
		sb.append("</ul>");

		sb.append("<script>");
		sb.append("function fn_paging(pageNo) {");
		sb.append("location.assign('" + url + "?cPage='+pageNo+'&numPerpage=" + numPerpage + "')");
		sb.append("}");
		sb.append("</script>");

		m.addAttribute("pageBar1", sb.toString());
		
		return "edoc/saved";
	}
	
	@GetMapping("/selectdoc")
	public void selectDoc() {}
	
	public Employee getEmployeeH() {
		return (Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}
	
	@GetMapping("/openedoc{docId}/{docType}/{docWriter}") 
	public String openEdoc(@PathVariable int docId, @PathVariable String docType, @PathVariable Long docWriter, Model m) {
		System.out.println(docWriter +" 이게 제대로 들어오냐이거야 ㅡ ㅡ ");
		Long empNo = getEmployeeH().getEmpNo();
		System.out.println(empNo);
		String page=""; 
		String tableName="";
	
		switch(docType) {
			case "T01": tableName = "basic_form"; page="edoc/opennew2"; break;
			case "T02": tableName = ""; break;
			case "T03": tableName = "trip_form"; page="edoc/opentrip"; break;
			case "T04": tableName = "off_form"; page="edoc/opennew"; break;
		} // 문서유형에 따라, 조인되는 tableName 과 jsp 페이지를 매칭
		AbstractDocument doc = service.selectDocumentById(docId); // 문서유형과는 상관 없음
		
		if(docWriter != empNo.longValue() && doc.getIsFirstOpened()==0) {
			System.out.println("이게 되면 안된다고 !!!! ");
			service.updateFirstOpened(docId);
			// 처음 열었을 때만, 문서 상태 update ! docStatus, isFirstOpened
			// getIsFirstOpened == 0 일 때만 실행되고, 1일 때는 update 가 실행되지 않음
		}
		
		// 문서정보가져와서 담아주기 ~ 
		Map<String,Object> param = new HashMap<>();
		param.put("docId", docId);
		param.put("tableName", tableName);
		param.put("docType", docType);		
		System.out.println(docType + "여기에 닥타입이 잇어야하는디 ");
		
		AbstractDocument abdocument = service.selectDocumentDetail(param);
		System.out.println(abdocument + "이게왜널인디 ? ");
		
		
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
		String reason = doc.getDocStat();
		
		// document 랑 approval 이랑 join where docId = #{docId} and  했을 때, appOrder 가지고와서 비교 !   
		// login 한 아이디가 필요함 !!!! appEmp == loginedEmpNo -> getAppOrder 
		long empNo = getEmployeeH().getEmpNo();
		
		Map<String,Object> param = new HashMap<>();
		param.put("docId", docId);
		param.put("empNo", empNo);
		param.put("docType", docType);
		param.put("writer", writer);
		param.put("reason", reason);
		
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
	@PostMapping("/reject")  // 반려를 구분해줘야 함 -> 기본보고서는 중간반려, 최종반려 모두 같고 || 휴가신청은 반려 시, 신청한 사용일수를 모두 되돌려줘야한다 !!  
	public String reject(@RequestBody BasicDocument doc) throws JsonMappingException, JsonProcessingException {
		String resultString = null;
		int docId = doc.getDocId();
		int finalOrder = doc.getRnum(); // approval 의 사이즈를 rnum에다가 담아준 거임 == 최종결재자 번호임 
		String docType = doc.getDocType();
		int writer = doc.getDocWriter();
		String reason = doc.getDocStat(); // 결재자의견
		int approver = doc.getApprover(); // 연차 사용신청일수
		
		// document 랑 approval 이랑 join where docId = #{docId} and  했을 때, appOrder 가지고와서 비교 !   
		// login 한 아이디가 필요함 !!!! appEmp == loginedEmpNo -> getAppOrder 
		long empNo = getEmployeeH().getEmpNo();
		
		Map<String,Object> param = new HashMap<>();
		param.put("docId", docId);
		param.put("empNo", empNo);
		param.put("docType", docType);
		param.put("writer", writer);
		param.put("reason", reason);
		param.put("vacaUsed", approver);
		
		if(docType.equals("T04")) {
//			휴가반려의 경우, 문서상태와 결재자상태를 모두 반려로 update, employee 의 remainingAnnualLeave 를 remainingAnnualLeave + vacaUsed
			int result = service.rejectDocument(param);
			if(result == 3) {
				resultString = "성공";
			} else {
				resultString = "실패";
			}
		} else {
			int result = service.rejectDocument(param);
			if(result==2) {
				resultString = "성공";
			} else {
				resultString = "실패";
			}
		}
		return resultString;
	}
	@ResponseBody
	@PostMapping("/returndoc")  // 반려를 구분해줘야 함 -> 기본보고서는 중간반려, 최종반려 모두 같고 || 휴가신청은 반려 시, 신청한 사용일수를 모두 되돌려줘야한다 !!  
	public String returnDoc(@RequestBody BasicDocument doc) throws JsonMappingException, JsonProcessingException {
		String resultString = null;
		int docId = doc.getDocId();
		String docType = doc.getDocType();
		int writer = doc.getDocWriter();
		int approver = doc.getApprover(); // 연차 사용신청일수
		
		// document 랑 approval 이랑 join where docId = #{docId} and  했을 때, appOrder 가지고와서 비교 !   
		// login 한 아이디가 필요함 !!!! appEmp == loginedEmpNo -> getAppOrder 
		long empNo = getEmployeeH().getEmpNo();
		
		Map<String,Object> param = new HashMap<>();
		param.put("docId", docId);
		param.put("docType", docType);
		param.put("writer", writer);
		param.put("vacaUsed", approver);
		
		if(docType.equals("T04")) {
//			휴가회수의 경우, employee 의 remainingAnnualLeave 를 remainingAnnualLeave + vacaUsed
			int result = service.updateDocStatToReturn(param);
			if(result == 2) {
				resultString = "성공";
			} else {
				resultString = "실패";
			}
		} else {
			int result = service.updateDocStatToReturn(param);
			if(result > 0) {
				resultString = "성공";
			} else {
				resultString = "실패";
			}
		}
		return resultString;
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
	
	@GetMapping("/filedownload")
	public void fileDownload(HttpServletResponse response, HttpSession session, 
			String renamedFilename,	String originalFilename) {
		String filePath = session.getServletContext().getRealPath("/resources/upload/edoc/");
		File downloadFile = new File(filePath + renamedFilename);
		try(FileInputStream fis = new FileInputStream(downloadFile);
				BufferedInputStream bis = new BufferedInputStream(fis);
					BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream())){
			String encoding = new String(originalFilename.getBytes("UTF-8"), "ISO-8859-1");
			System.out.println("encoding : " + encoding);
			response.setContentType("application/octet-stream;charset=UTF-8");
			response.setHeader("Content-disposition", "attachment;filename=\"" + encoding + "\"");
			int data = 1;
			while((data = bis.read()) != -1) {
				bos.write(data);
			}
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
}
