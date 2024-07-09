package com.waait.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.waait.dto.Document;
import com.waait.dto.Employee;
import com.waait.service.EDocService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/edoc")
@RequiredArgsConstructor
public class EDocController {
	
	private final EDocService service;
	
	@GetMapping("/basicedoc")
	public void basicEdoc() {}
	
	@PostMapping("/basicedocend")
	public String insertBasic(@RequestPart(value="") String obj, @RequestPart(value="file", required=false) List<MultipartFile> uploadFiles) {
		
	// required = false : 파일 첨부가 필수가 아닌 선택, value = "file" : MultipartFile 요청에서 input[name='file'] 추출
		System.out.println("안녕");
		Document doc;
		try {
			ObjectMapper objectMapper = new ObjectMapper();
			doc = objectMapper.readValue(obj, Document.class); 
			System.out.println(doc.getDocTitle());
			System.out.println(doc);
			int result = service.insertBasicEdoc(doc);
			System.out.println(result);
			log.debug("안녕");
			
			// 파일 업로드 처리
	        if (uploadFiles != null && !uploadFiles.isEmpty()) {
	            for (MultipartFile file : uploadFiles) {
	                // 파일 저장 로직 추가 (예: file.transferTo(new File("/path/to/save")))
	                log.info("파일 업로드: " + file.getOriginalFilename());
	            }
	        }
//	    } catch (IOException e) {
//	        log.error("JSON 파싱 오류", e);
//	        return "redirect:/edoc/basicedoc?error=json";
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
	}
	
	@RequestMapping("/home")
	public void home() {}
	
	@GetMapping("/selectdoc")
	public void selectDoc() {}
	
	
}
