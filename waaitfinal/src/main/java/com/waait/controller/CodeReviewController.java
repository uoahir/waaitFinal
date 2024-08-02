package com.waait.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.waait.dto.CodeReviewBoard;
import com.waait.dto.CodeReviewBoardComment;
import com.waait.dto.CodeReviewBoardFile;
import com.waait.dto.Employee;
import com.waait.service.CodeReviewService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor

public class CodeReviewController {

	private final CodeReviewService codeReviewService;

	// 파일 데이터 저장하고 넘기는 Controller
	@GetMapping("/codereviewboard/writeboard")
	public String CodeReviewBoard() {
		return "codereviewboard/codeReviewBoardWriteP";
	}

	@PostMapping("/codereviewboard/insert")
	public String insertCodeR(CodeReviewBoard c, MultipartFile[] upFile, HttpSession session) {
		Employee employee = (Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		// String path = 프러젝트 파일 내부 경로를 가져옴
		System.out.println("로그인한사람" + employee);
		System.out.println("보드 정보" + c);
		System.out.println(upFile.length);
		String path = session.getServletContext().getRealPath("resoucres/upload/codeReview");
		if (upFile != null) {
			for (MultipartFile file : upFile) {
				if (!file.isEmpty()) {
					String oriName = file.getOriginalFilename();
					String ext = oriName.substring(oriName.lastIndexOf("."));
					Date today = new Date(System.currentTimeMillis());
					int randomVal = (int) (Math.random() * 100000) + 1;
					String rename = "waait" + (new SimpleDateFormat("yyyyMMdd_HHmmssSSS").format(today)) + "_"
							+ randomVal + ext;
					File dir = new File(path);
					if (!dir.exists())
						dir.mkdirs();
					try {
						file.transferTo(new File(path, rename));

						c.setCodeFile(
								CodeReviewBoardFile.builder().originalFileName(oriName).renameFileName(rename).build());
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}

		}
		c.setEmpNo(employee.getEmpNo());
		c.setCodeWrite(employee.getEmpName());
		// System.out.println("코드리뷰객체" + c); 출력부분 성공~
		// System.out.println("코드파일 객체" + c.getCodeFile());출력부분 성공~

		int result = codeReviewService.insertCodeR(c);
		// try문으로 결과값 처리
		return "redirect:/codereviewboard/main";
	}

	// System.out.println("코드내용"+codeContent);
	// 고생이 많군요? ㅋ.ㅋ 이건 누구지?????

	/*
	 * @GetMapping("/codereviewboard/main") // 메인 페이지 요청 public String pageCodeR() {
	 * return "codereviewboard/main"; }
	 */

	@GetMapping("/codereviewboard/main") // maincodeBoardController
	public String codePage(HttpSession session, Model model, @RequestParam(defaultValue = "1") int cPage,
			@RequestParam(defaultValue = "10") int numPerpage) {

		List<CodeReviewBoard> codeReviewBoards = codeReviewService
				.selectcodeReviewBoards(Map.of("cPage", cPage, "numPerpage", numPerpage));
		
		int totalData = codeReviewService.selectAllCodeReviewBoard();
		int totalPage = (int) Math.ceil((double) totalData / numPerpage);
		int pageBarSize = 5;
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;
		String url = "main";

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

		model.addAttribute("pageBar", sb.toString());
		model.addAttribute("codeReviewBoards", codeReviewBoards);
		List<CodeReviewBoard> codes = codeReviewService.selectAll();
		
		model.addAttribute("codes",codes);
		
		model.addAttribute(sb);
		return "codereviewboard/main";
	}

	@GetMapping("/morecodereviewboards/page")
	public String moreCodeReviewBoard(HttpSession session, Model model, @RequestParam(defaultValue = "1") int cPage,
			@RequestParam(defaultValue = "10") int numPerpage) {
		List<CodeReviewBoard> codeReviewBoards = codeReviewService
				.selectcodeReviewBoards(Map.of("cPage", cPage, "numPerpage", numPerpage));
		model.addAttribute("codeReviewBoards", codeReviewBoards);
		return "codereviewboard/codeboardpage";
	}

	@GetMapping("/codereviewboard/codereview{no}")
	public String selectBoardNo(@PathVariable int no, Model model) {
		CodeReviewBoard codeReviewBoard = codeReviewService.selectcodeReviewBoard(no);
		List<CodeReviewBoardComment> reviewComments = codeReviewService.selectCodeReviewBoardsComment(no);
		// System.out.println("댓글 수 출력부분:"+reviewComment.size()); 출력부분 성공~
		// System.out.println(codeReviewBoard); 출력부분 성공~
		model.addAttribute("reviewComments", reviewComments); // 댓글 형태 LIST
		model.addAttribute("codeReviewBoard", codeReviewBoard);// 게시글 : 객체
		return "codereviewboard/codereviewdetail";
	}

	/*
	 * @PostMapping("/codereview/comment/insert") public String
	 * codeReviewCommentInsert(int no, Model model, String codeReviewContent) {
	 * CodeReviewBoardComment codeReviewC = CodeReviewBoardComment.builder()
	 * .codeReviewName(getEmployeeH().getEmpName()).codeReviewContent(
	 * codeReviewContent) .empNo(getEmployeeH().getEmpNo()).codeBoardNo(no).build();
	 * System.out.println("내용 체크 테스트" + codeReviewC); int result =
	 * codeReviewService.insertCodeReviewR(codeReviewC); if (result != 1) {
	 * model.addAttribute(codeReviewC); 댓글 실패부분 아직 미구현 } else { return
	 * "redirect:/codereviewboard/codereview" + no; }
	 * 
	 * return "redirect:/codereviewboard/codereview" + no; }
	 */

	public Employee getEmployeeH() {
		return (Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}

	@ResponseBody
	@PostMapping("/codereview/comment/insert")
	public ResponseEntity<Map<String, String>> insertComment(@RequestBody CodeReviewBoardComment c) {
		c.setCodeReviewName(getEmployeeH().getEmpName());
		c.setEmpNo(getEmployeeH().getEmpNo());
		int result = codeReviewService.insertCodeReviewR(c);
		System.out.println(result);

		Map<String, String> param = new HashMap<>();
		return ResponseEntity.ok(param);
	}

}