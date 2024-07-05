package com.waait.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.waait.dto.CodeReviewBoard;
import com.waait.dto.CodeReviewBoardFile;
import com.waait.dto.Employee;
import com.waait.service.CodeReviewService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
@RequestMapping("/codereviewboard")
public class CodeReviewController {
	
	private final CodeReviewService codeReviewService;
	// 파일 데이터 저장하고 넘기는 Controller
	@PostMapping("/insert")
	public String insertCodeR(CodeReviewBoard c, MultipartFile[] upFile, HttpSession session) {
		Employee employee = (Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		// String path = 프러젝트 파일 내부 경로를 가져옴
		System.out.println(upFile.length);
		String path = session.getServletContext().getRealPath("resoucres/upload/codeReview");
		if (upFile != null) {
			for (MultipartFile file : upFile) {
				if (!file.isEmpty()) {
					String oriName = file.getOriginalFilename();
					String ext = oriName.substring(oriName.lastIndexOf("."));
					Date today = new Date(System.currentTimeMillis());
					int randomVal = (int)(Math.random()*100000)+1;
					String rename = "waait"+(new SimpleDateFormat("yyyyMMdd_HHmmssSSS").format(today))+
							"_"+randomVal+ext;
					File dir = new File(path);
					if(!dir.exists()) dir.mkdirs();
					try {
						file.transferTo(new File(path,rename));
						
						c.setCodeFile(CodeReviewBoardFile.builder().originalFileName(oriName)
								.renameFileName(rename)
								.build());
					}catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
			
		}
		c.setEmployeeNo(employee.getEmpNo());
		c.setCodeWrite(employee.getEmpName());
		System.out.println("코드리뷰객체"+c);
		System.out.println("코드파일 객체"+c.getCodeFile());
		
		int result = codeReviewService.insertCodeR(c);
		// try문으로 결과값 처리
		return "redirect:/user";
	}

	// System.out.println("코드내용"+codeContent);
	// 고생이 많군요? ㅋ.ㅋ
	
	@GetMapping("/page")
	public String pageCodeR() {
		return "codereviewboard/codewriteboard";
	}

}
