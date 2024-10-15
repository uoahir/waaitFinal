package com.waait.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.waait.dto.Employee;
import com.waait.dto.Mail;
import com.waait.dto.MailFile;
import com.waait.dto.MailSetting;
import com.waait.dto.MyMailBox;
import com.waait.dto.RecentSearch;
import com.waait.dto.SpamDomain;
import com.waait.service.MailService;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;


@Controller
@RequiredArgsConstructor
@RequestMapping("/mail")
public class MailController {
	
	private final MailService service;
//	private final ObjectMapper mapper;
	
	//totalData : 총 데이터수 totalPage
	//cPage : 현재 페이지
	//numPerpage : 페이지당 데이터 수
	//url : 페이징처리된 페이지바의 숫자를 눌렀을때 요청을 보낼 주소
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
//			sb.append("<a class='page-link' href='javascript:fn_paging(" + (pageNo - 1) + ")'>이전</a>");
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
//				sb.append("<a class='page-link' href='javascript:fn_paging(" + pageNo + ")'>" + pageNo + "</a>");
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
//			sb.append("<a class='page-link' href='javascript:fn_paging(" + pageNo + ")'>다음</a>");
			sb.append("<a class='page-link' href='javascript:ajaxPaging(" + pageNo + ",\"" + url + "\")'>다음</a>");
			sb.append("</li>");
		}
		sb.append("</ul>");
		
//		sb.append("<script>");
//		sb.append("function ajaxPaging(pageNo) {");
//		sb.append("console.log('pageNo : ' + pageNo);");
//		sb.append("fetch('${path }" + url + "?cPage=' + pageNo + '&numPerpage=" + numPerpage + "')");
//		sb.append(".then(response => response.text())");
//		sb.append(".then(data => {");
//		sb.append("document.getElementById('mailListContainer').innerHTML = data;");
//		sb.append("});");
//		sb.append("}");
//		sb.append("</script>");
		
//		function ajaxPaging(pageNo) {
//			console.log("왜 너가 실행 돼?");
//			fetch("${path }/mail/joinsendingmailbox.do?cPage=1&numPerpage=5")
//			.then(response => response.text())
//			.then(data => {
//				document.getElementById("mailListContainer").innerHTML = data;
//			});	
//		}
		
//		sb.append("<script>");
//		sb.append("function fn_paging(pageNo) {");
//		sb.append("location.assign('" + url + "?cPage='+pageNo+'&numPerpage=" + numPerpage + "')");
//		sb.append("}");
//		sb.append("</script>");
		
		return sb.toString();
	}
	
	public int getUserSettingNumPerpage(long empNo) {
		MailSetting mailSetting = service.getMailSetting(empNo);
		int numPerpage = 0;
		
		if(mailSetting == null) {
			service.setMailSetting(empNo);
			numPerpage = 5;
		} else {
			numPerpage = mailSetting.getMailNumPerpage();
		}
		
		return numPerpage;
	}
	
	
	@GetMapping("/mailmain.do")
	public String changeMailView(Model model,
								@RequestParam(defaultValue = "1") int cPage) {
		Employee employee = getLoginEmpInfo();
		String mailReceiverAddress = employee.getEmpEmail();
		long empNo = employee.getEmpNo();
		int spamMailCount = 0;
		int numPerpage = 0;
		
		List<SpamDomain> spamDomains = service.getSpamDomain(empNo);
		List<MyMailBox> myMailBoxList = service.getMyMailBox(empNo);
		
		Map<String, Object> spamMailParam = Map.of("loginMemberEmailDomain", mailReceiverAddress, "spamDomains", spamDomains);
		if(spamDomains != null && spamDomains.size() > 0 && !spamDomains.isEmpty()) {
			spamMailCount = service.getSpamMailCount(spamMailParam);
		}
		
		numPerpage = getUserSettingNumPerpage(empNo);
		
//		numPerpage = 10; //지워야 됨
		Map<String, Object> mailSettings = Map.of("cPage", cPage, "numPerpage", numPerpage,
													"spamDomains", spamDomains, "mailReceiverAddress", mailReceiverAddress);
		
		List<Mail> mailList = service.getReceiveMail(mailSettings);
		
		int notReadCount = service.notReadDataCount(mailSettings);
		
//		List<RecentSearch> searchList = service.getRecentSearch(empNo);
//		List<MyMailBoxDetail> myMailBoxList = service.getMyMailBox(empNo);
		
		System.out.println("가져온 mailList : " + mailList);
		
		int totalData = service.getTotalData(mailSettings);
		System.out.println("totalData : " + totalData);
		int totalPage = (int) Math.ceil((double) totalData/ numPerpage);
		int pageBarSize = 5;
		int pageNo = ((cPage - 1) / pageBarSize) * pageBarSize + 1;
		int pageEnd = pageNo + pageBarSize - 1;
		String url = "mailmain.do";
		
		StringBuffer sb = new StringBuffer();
		sb.append("<ul class='pagination justify-content-center pagination-sm' style='margin-top : 50px;'>");
		if(pageNo == 1) {
			sb.append("<li class='page-item disabled'>");
			sb.append("<a class='page-link' href='#'>이전</a>");
			sb.append("</li>");
		} else {
			sb.append("<li class='page-item'>");
			sb.append("<a class='page-link' href='javascript:fn_paging(" + (pageNo - 1) + ")'>이전</a>");
			sb.append("</li>");
		}
		
		while(!(pageNo > pageEnd || pageNo > totalPage)) {
			if(pageNo == cPage) {
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
		
		if(pageNo > totalPage) {
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
		sb.append("console.log('너는 되냐?');");
		sb.append("location.assign('" + url + "?cPage='+pageNo+'&numPerpage=" + numPerpage + "')");
		sb.append("}");
		sb.append("</script>");
		
//		System.out.println("recentSearch : " + searchList);
		model.addAttribute("mails", mailList);
		model.addAttribute("myMailBoxes", myMailBoxList);
		model.addAttribute("pageBar", sb.toString());
		model.addAttribute("notReadCount", notReadCount);
		model.addAttribute("spamMailCount", spamMailCount);
//		model.addAttribute("recentSearch", searchList);
		
		return "mail/mailmain";
	}
	
	@GetMapping("/receivingmail.do")
	public String receivingMail(Model model, @RequestParam(defaultValue = "1") int cPage) {
		String mailReceiverAddress = getLoginEmpInfo().getEmpEmail();
		long empNo = getLoginEmpInfo().getEmpNo();
		int numPerpage = 0;
		numPerpage = getUserSettingNumPerpage(empNo);
		
		
		List<SpamDomain> spamDomains = service.getSpamDomain(empNo);
		
		Map<String, Object> mailSettings = Map.of("cPage", cPage, "numPerpage", numPerpage,
				"spamDomains", spamDomains, "mailReceiverAddress", mailReceiverAddress);
		int totalData = service.getTotalData(mailSettings);
		int pageBarSize = 5;
		String url = "/mail/receivingmail.do";
		String pageBar = paging(totalData, cPage, numPerpage, pageBarSize, url);
		
		List<Mail> mailList = service.getReceiveMail(mailSettings);
		
		model.addAttribute("mails", mailList);
		model.addAttribute("pageBar", pageBar);
		model.addAttribute("mailReceiverAddress", mailReceiverAddress);
		return "mail/mailresponse/receiving_mail_list";
	}
	
	@PostMapping("/settingspamdomain.do")
	public @ResponseBody String settingSpamDomain(String spamDomain) {
		int result = 0;
		System.out.println("spamDomain : " + spamDomain);
		Map<String, Object> param = new HashMap<String, Object>();
		long empNo = getLoginEmpInfo().getEmpNo();
		
		String[] domainArr = spamDomain.split(",");
		for(String domain : domainArr) {
			param.put("empNo", empNo);
			param.put("domain", domain);
			result = service.insertSpamDomain(param);
		}
		
		if(result > 0) return "성공적으로 등록되었습니다.";
		else return "등록에 실패했습니다.";
	}
	
	@GetMapping("/joinspammail.do")
	public String joinSpamMail(Model model) {
		List<Mail> spamMailList = new ArrayList<Mail>();
		String loginMemberEmailDomain = getLoginEmpInfo().getEmpEmail();
		long empNo = getLoginEmpInfo().getEmpNo();
		
		List<SpamDomain> spamDomains = service.getSpamDomain(empNo);
		
		Map<String, Object> param = Map.of("loginMemberEmailDomain", loginMemberEmailDomain, "spamDomains", spamDomains);
		if(spamDomains != null && spamDomains.size() > 0 && !spamDomains.isEmpty()) {
			spamMailList = service.getSpamMail(param);
		}
		System.out.println("spamMailList : " + spamMailList);
		
		model.addAttribute("spamMails", spamMailList);
		return "mail/mailresponse/spam_mail_list";
	}
	
	@GetMapping("/enrollmymailbox.do")
	public @ResponseBody Map<String, Object> enrollUserMailBox(String wantBoxName) {
		long empNo = getLoginEmpInfo().getEmpNo();
		Map<String, Object> newMyMailBoxInfo = new HashMap<String, Object>();
		List<MyMailBox> boxList = service.getMyMailBox(empNo);
		
		for(MyMailBox mailBox : boxList) {
			if(mailBox.getMyMailBoxName().equals(wantBoxName)) {
				newMyMailBoxInfo.put("errorMsg", "메일함 이름은 중복될 수 없습니다");
				return newMyMailBoxInfo;
			}
		}
		System.out.println("박스 리스트 가져오는 건 지나감");
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("empNo", empNo);
		param.put("wantBoxName", wantBoxName);
		
		System.out.println("wantBoxName : " + wantBoxName);
		int myMailBoxNo = service.enrollUserMailBox(param);
		newMyMailBoxInfo.put("myBoxName", wantBoxName);
		newMyMailBoxInfo.put("myMailBoxNo", myMailBoxNo);
		
		return newMyMailBoxInfo;
		
	}
	
	@GetMapping("/refreshmymailboxmodal.do")
	public String getRecentMyMailBoxInfo(Model model) {
		long empNo = getLoginEmpInfo().getEmpNo();
		List<MyMailBox> boxList = service.getMyMailBox(empNo);
		model.addAttribute("myMailBoxes", boxList);
		return "mail/mailresponse/mymailbox_modal";
	}
	
	@PostMapping("/deletespamdomain.do")
	public @ResponseBody int deleteSpamDomain(String domainAddresses) {
		int result = 0;
		System.out.println("domainAddress : " + domainAddresses);
		long empNo = getLoginEmpInfo().getEmpNo();
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("empNo", empNo);
		param.put("domainAddresses", domainAddresses);
		result = service.deleteSpamDomain(param);
		return result;
	}
	
	@GetMapping("/maildetail.do")
	public String mailDetailView(Model model, int mailNo) {
		System.out.println("매개변수로 들어온 mailNo : " + mailNo);
		String userMailAddress = getLoginEmpInfo().getEmpEmail();
		long empNo = getLoginEmpInfo().getEmpNo();
		Map<String, Object> param = Map.of("mailNo", mailNo, "userMailAddress", userMailAddress);
		
		Mail mail = service.getMailDetailByNo(param);
		System.out.println("maildetail로 보낼 메일 : " + mail);
		List<MyMailBox> myMailBoxList = service.getMyMailBox(empNo);
		
		service.updateReceiverReadStatus(param);
		updateRecentReadStatus(mail.getMailNo());
		
		model.addAttribute("mail", mail);
		model.addAttribute("empMailAddress", userMailAddress);
		model.addAttribute("myMailBoxes", myMailBoxList);
		return "mail/maildetail";
	}
	
	@GetMapping("/addfavorite.do")
	public @ResponseBody int addFavoriteMail(String mailNo) {
		return service.addFavoriteMail(mailNo);
	}
	
	@GetMapping("/canceladdfavorite.do")
	public @ResponseBody int cancelAddFavorite(String mailNo) {
		return service.cancelAddFavorite(mailNo);
	}
	
	@GetMapping("/writemail.do")
	public void changeWriteMailView(Model model, 
			@RequestParam(defaultValue = "-1") int mailNo) {
		String name = getLoginEmpInfo().getEmpName();
		String writerEmailAddress = getLoginEmpInfo().getEmpEmail();
		
		model.addAttribute("writerName", name);
		model.addAttribute("writerMailAddress", writerEmailAddress);
		
		if(mailNo != -1) {
			Mail temporaryWriteMail = service.joinTempoSaveMailByMailNo(mailNo);
			model.addAttribute("temporaryWriteMail", temporaryWriteMail);
			System.out.println("temporaryWriteMail확인 : " + temporaryWriteMail);
		}

	}
	
	@PostMapping("/sendmail.do")
	public String sendMail(MultipartFile[] upFile, HttpSession session, String mailContent, String mailTitle, String[] mailReceiverAddress, String mailStatus) {
		System.out.println("매개변수로 들어온 receiverArr 길이 : " + mailReceiverAddress.length);
		Arrays.stream(mailReceiverAddress).forEach(m -> {
			System.out.println("mailReceiverAddress : " + m);
			if(m.length() == 0) {
				System.out.println("빈 배열");
			}
		});
		
		long writerNo = getLoginEmpInfo().getEmpNo();
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("mailContent", mailContent);
		param.put("mailTitle", mailTitle);
		System.out.println("mailConetnt : " + mailContent + " mailTitle : " + mailTitle + " mailStatus : " + mailStatus + " :writerNo : " + writerNo);
		param.put("mailReceiverAddress", mailReceiverAddress);
		param.put("mailStatus", mailStatus);
		param.put("writerNo", writerNo);
		int mailSequence = service.sendMail(param);
		
		String path = session.getServletContext().getRealPath("resources/upload/mail");
		if (upFile != null) {
			System.out.println("upFile은 null 이 아님");
			for (MultipartFile file : upFile) {
				System.out.println("fileName : " + file.getOriginalFilename());
				if (!file.isEmpty()) {
					String oriName = file.getOriginalFilename();
					String ext = oriName.substring(oriName.lastIndexOf("."));
					Date today = new Date(System.currentTimeMillis());
					int randomVal = (int) (Math.random() * 100000) + 1;
					String rename = "waait" + (new SimpleDateFormat("yyyyMMdd_HHmmssSSS").format(today)) + "_"
							+ randomVal + ext;
					long fileSize = file.getSize();
					File dir = new File(path);
					if (!dir.exists()) dir.mkdirs();
					
					MailFile mailFile = MailFile.builder()
												.mailNo(mailSequence)
												.mailOriginalFileName(oriName)
												.mailRenamedFileName(rename)
												.mailFileSize(fileSize)
												.build();
					
					try {
						int result = service.updateFile(mailFile);
						if(result < 0) throw new RuntimeException();
					} catch(Exception e) {
						e.printStackTrace();
					}
					
					try {
						file.transferTo(new File(path, rename));
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}

		}
		return "redirect:/mail/mailmain.do";
	}
	
	@PostMapping("/addmailmymailbox.do")
	public @ResponseBody int addMailMyMailBox(String mailNoStr, String myMailBoxNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		System.out.println("mailNoStr : " + mailNoStr + " myMailBoxNo : " + myMailBoxNo);
		param.put("mailNoStr", mailNoStr);
		param.put("myMailBoxNo", myMailBoxNo);
		
		return service.addMailMyMailBox(param);
	}
	
	//내 메일함 메일조회
	@GetMapping("/joinmymailbox.do")
	public String myMailBoxDetailView(int myMailBoxNo, Model model,
			@RequestParam(defaultValue = "1") int cPage) {
		long empNo = getLoginEmpInfo().getEmpNo();
		int numPerpage = 0;
		int pageBarSize = 5;
		String url = "/mail/joinmymailbox.do";
		numPerpage = getUserSettingNumPerpage(numPerpage);
		Map<String, Integer> pagingParam = Map.of("cPage", cPage, "numPerpage", numPerpage);
		int myMailBoxTotalData = service.getMyMailBoxTotalData(myMailBoxNo);
		String pageBar = paging(myMailBoxTotalData, cPage, numPerpage, pageBarSize, url);
		
		List<Mail> mailList = service.joinMyMailBoxDetail(myMailBoxNo, pagingParam);
		System.out.println("myMailBoxMailList : " + mailList);
		
		model.addAttribute("mails", mailList);
		model.addAttribute("pageBar", pageBar);
		
		return "mail/mailresponse/mymailbox_mail_list";
	}
	
	@GetMapping("/myfavoritemailbox.do")
	public String joinFavoriteMailBox(Model model, @RequestParam(defaultValue = "1") int cPage) {
		long empNo = getLoginEmpInfo().getEmpNo();
		String loginMemberEmailDomain = getLoginEmpInfo().getEmpEmail();
		int numPerpage = getUserSettingNumPerpage(empNo);
		int totalData = service.getFavoriteMailTotalData(loginMemberEmailDomain);
		int pageBarSize = 5;
		String url = "/mail/myfavoritemailbox.do";
		String pageBar = paging(totalData, cPage, numPerpage, pageBarSize, url);
		
		List<Mail> mailList = service.joinFavoriteMailBox(loginMemberEmailDomain);
		System.out.println("favoriteList : " + mailList);
		
		model.addAttribute("mails", mailList);
		model.addAttribute("pageBar", pageBar);
		
		return "mail/mailresponse/favorite_mail_list";
	}
	
	@GetMapping("/temporarysavemailbox.do")
	public String joinTempoSaveMailBox(Model model, @RequestParam(defaultValue = "1") int cPage) {
		long empNo = getLoginEmpInfo().getEmpNo();
		int totalData = service.getTempoSaveMailTotalData(empNo);
		int numPerpage = getUserSettingNumPerpage(empNo);
		int pageBarSize = 5;
		String url = "/mail/temporarysavemailbox.do";
		
		String pageBar = paging(totalData, cPage, numPerpage, pageBarSize, url);
		
		List<Mail> temporarySaveMailList = service.joinTempoSaveMailBox(empNo);
		System.out.println("temporarySaveMailList : " + temporarySaveMailList);
		
		model.addAttribute("mails", temporarySaveMailList);
		model.addAttribute("pageBar", pageBar);
		
		return "mail/mailresponse/temposave_mail_response";
	}
	
	@GetMapping("/continuewritemail.do")
	public String continueWriteMail(int mailNo, Model model) {
		Mail temporarySaveMail = service.joinTempoSaveMailByMailNo(mailNo);
		System.out.println("tempSaveMailContinue : " + temporarySaveMail);
		model.addAttribute("mail", temporarySaveMail);
		
		return "mail/writemail";
	}
	
//	@PostMapping("/deletreceivemail.do")
//	public String deleteReceiveMail(String mailNoStr, Model model) {
//		String receiverAddress = getLoginEmpInfo().getEmpEmail();
//		System.out.println("mailNoStr : " + mailNoStr);
//		Map<String, String> sqlParam = new HashMap<String, String>();
//		sqlParam.put("mailNoStr", mailNoStr);
//		sqlParam.put("receiverAddress", receiverAddress);
//		
//		service.deleteReceiveMail(sqlParam);
//		
//		return receivingMail(model, 1);
//	}
//	
//	@PostMapping("/deletsendmail.do")
//	public String deleteSendMail(String mailNoStr, Model model) {
//		System.out.println("mailNoStr : " + mailNoStr);
//		service.deleteSendingMail(mailNoStr);
//		return joinSendingMailBox(model, 1);
//	}
	
	@PostMapping("/deletemymailbox.do")
	public String deleteMyMailBox(int myMailBoxNo, Model model) {
		long empNo = getLoginEmpInfo().getEmpNo();
		List<Mail> mailInMyMailBox = service.joinMyMailBoxDetail(myMailBoxNo, null);
		
		service.moveMailToTrashMailBox(mailInMyMailBox);
		
		service.deleteMyMailBox(myMailBoxNo);
		List<MyMailBox> myMailBoxList = service.getMyMailBox(empNo);
		model.addAttribute("mailBoxes", myMailBoxList);
		
		return "mail/mailresponse/mymailbox_list";
	}
	
	@GetMapping("/jointrashmailbox.do")
	public String jointrashmailbox(Model model, @RequestParam(defaultValue = "1") int cPage) {
		long empNo = getLoginEmpInfo().getEmpNo();
		String receiverMailAddress = getLoginEmpInfo().getEmpEmail();
		
		int totalData = service.trashMailBoxTotalData(receiverMailAddress);
		int numPerpage = getUserSettingNumPerpage(empNo);
		String url = "/jointrashmailbox.do";
		Map<String, Integer> pagingParam = Map.of("cPage", cPage, "numPerpage", numPerpage);
		String pageBar = paging(totalData, cPage, numPerpage, cPage, url);
		
		List<Mail> trashMailList = service.jointrashmailbox(receiverMailAddress, pagingParam);
		
		System.out.println("trashMailList : " + trashMailList);
		model.addAttribute("mails", trashMailList);
		model.addAttribute("pageBar", pageBar);
		model.addAttribute("receiverMailAddress", receiverMailAddress); //변경해야함
		return "mail/mailresponse/trash_mail_list"; //여기도 jsp도
	}
	
	@PostMapping("/deletemail.do")
	public String deleteMail(String mailNoStr, String returnViewName, Model model) {
		System.out.println("mailNoStr : " + mailNoStr);
		String userMailAddress = getLoginEmpInfo().getEmpEmail();
		List<Mail> mailListForDelete = service.getMailForDelete(mailNoStr);
		System.out.println("mailListForDelete : " + mailListForDelete);
		System.out.println("returnViewName : " + returnViewName);
	
		for(Mail mail : mailListForDelete) {
			if(mail.getSenderMailAddress().equals(userMailAddress) && 
					mail.getReceivers().get(0).getMailReceiverAddress().equals(userMailAddress)) {
				Map<String, Object> sqlParam = Map.of("mailNo", mail.getMailNo(),
						"userMailAddress", userMailAddress);
				service.deleteSendingMail(mail.getMailNo());
				service.deleteReceiveMail(sqlParam);
			} else if(mail.getSenderMailAddress().equals(userMailAddress)) {
				service.deleteSendingMail(mail.getMailNo());
			} else {
				Map<String, Object> sqlParam = Map.of("mailNo", mail.getMailNo(),
													"userMailAddress", userMailAddress);
				service.deleteReceiveMail(sqlParam);
			}
		}
		
		if(returnViewName.equals("받은메일함"))  {
			System.out.println("받은메일함 조건문");
			return receivingMail(model, 1);
		} else if(returnViewName.equals("보낸메일함")) {
			System.out.println("보낸메일함 조건문");
			return joinSendingMailBox(model, 1);
		} else if(returnViewName.equals("myMailBox")) {
			return myMailBoxDetailView(1, model, 1);
		}
		return null;
	}
	
	@PostMapping("/perfectlydeletemail.do")
	public String perfectlyDeleteMail(String mailNoStr, HttpSession session) {
		Map<String, String> deleteSqlParam = new HashMap<String, String>();
		String loginMemberMailAddress = getLoginEmpInfo().getEmpEmail();
		System.out.println("완전삭제 메소드 mailNoStr : " + mailNoStr);
		
		Map<String, String> sqlParam = new HashMap<String, String>();
		sqlParam.put("loginMemberMailAddress", loginMemberMailAddress);
		sqlParam.put("mailNoStr", mailNoStr);
		
		//쓰레기통에있는 메일을 선택한 mailNo로 조회
		List<Mail> getMailForDelete = service.getMailForDelete(mailNoStr);
		System.out.println("완전삭제를 위한 trashMailList : " + getMailForDelete);
		
		getMailForDelete.forEach(mail -> {
			if(mail.getSenderMailAddress().equals(loginMemberMailAddress) && 
					mail.getReceivers().get(0).getMailReceiverAddress().equals(loginMemberMailAddress)) {
				System.out.println("내게쓰기 조건문");
				deleteSqlParam.put("mailNo", String.valueOf(mail.getMailNo()));
				deleteSqlParam.put("loginMemberMailAddress", loginMemberMailAddress);
				service.receiverPerfectlyDeleteMail(deleteSqlParam);
				service.senderPerfectlyDeleteMail(mail.getMailNo());
			} else if(mail.getSenderMailAddress().equals(loginMemberMailAddress)) {
				System.out.println("발신자 완전삭제 조건문");
				service.senderPerfectlyDeleteMail(mail.getMailNo());
			} else {
				System.out.println("수신자 완전삭제 조건문");
				deleteSqlParam.put("mailNo", String.valueOf(mail.getMailNo()));
				deleteSqlParam.put("loginMemberMailAddress", loginMemberMailAddress);
				service.receiverPerfectlyDeleteMail(deleteSqlParam);
			}
		});
		
		return "redirect:/mail/jointrashmailbox.do";
	}
	
	@PostMapping("/restoretrashmail.do")
	public @ResponseBody int restoreTrashMail(String mailNoStr) {
		int result = 0;
		String userMailAddress = getLoginEmpInfo().getEmpEmail();
		
		List<Mail> getMailForRestore = service.getTrashMailForRestore(mailNoStr);
		
		for(Mail mail : getMailForRestore) {
			if(mail.getSenderMailAddress().equals(userMailAddress) && 
					mail.getReceivers().get(0).getMailReceiverAddress().equals(userMailAddress)) {
				Map<String, Object> restoreSqlParam = new HashMap<String, Object>();
				restoreSqlParam.put("mailNo", mail.getMailNo());
				restoreSqlParam.put("userMailAddress", userMailAddress);
				result = service.senderRestoreMail(mail.getMailNo());
				result = service.receiverRestoreMail(restoreSqlParam);
			} else if(mail.getSenderMailAddress().equals(userMailAddress)) {
				System.out.println("발신자 복구 조건문 and mailNo : " + mail.getMailNo());
				result = service.senderRestoreMail(mail.getMailNo());
			} else {
				System.out.println("수신자 복구 조건문");
				Map<String, Object> restoreSqlParam = new HashMap<String, Object>();
				restoreSqlParam.put("mailNo", mail.getMailNo());
				restoreSqlParam.put("userMailAddress", userMailAddress);
				result = service.receiverRestoreMail(restoreSqlParam);
			}
		}
		
		return result;
	}
	
	@GetMapping("/joinsendingmailbox.do")
	public String joinSendingMailBox(Model model, @RequestParam(defaultValue = "1") int cPage) {
		long empNo = getLoginEmpInfo().getEmpNo();
		int numPerpage = 0;
		int totalData = service.joinSendingMailBoxTotalData(empNo);
		int pageBarSize = 5;
		String url = "/mail/joinsendingmailbox.do";
		numPerpage = getUserSettingNumPerpage(empNo);
		Map<String, Integer> pagingParam = Map.of("cPage", cPage, "numPerpage", numPerpage);
		
		String pageBar = paging(totalData, cPage, numPerpage, pageBarSize, url);
		
		List<Mail> sendingMailList = service.joinSendingMailBox(empNo, pagingParam);
		
		
		System.out.println("sendingMailList : " + sendingMailList);
		model.addAttribute("mails", sendingMailList);
		model.addAttribute("pageBar", pageBar);
		return "mail/mailresponse/sending_mail_list";
	}
	
	@PostMapping("/searchmail.do")
	public String searchReceiveMail(String searchType, String searchValue, Model model,
								@RequestParam(defaultValue = "1") int cPage) {
		String receiverMailAddress = getLoginEmpInfo().getEmpEmail();
		long empNo = getLoginEmpInfo().getEmpNo();
		System.out.println("searchType : " + searchType);
		String modifySearchType = searchType.substring(1, searchType.lastIndexOf("]"));
		
		System.out.println("modifySearchType : " + modifySearchType);
		
		switch(modifySearchType) {
			case "내용" : searchType = "M.MAILCONTENT"; break;
			case "타이틀" : searchType = "M.MAILTITLE"; break;
			case "보낸사람" : searchType = "E.EMPEMAIL"; break;
		}
		
		List<SpamDomain> spamDomains = service.getSpamDomain(empNo);
		Map<String, Object> searchParam = Map.of("searchType", searchType, "searchValue", searchValue, "receiverMailAddress", receiverMailAddress, "spamDomains", spamDomains);
		
		int numPerpage = 0;
		numPerpage = getUserSettingNumPerpage(empNo);
		Map<String, Integer> pagingParam = Map.of("cPage", cPage, "numPerpage", numPerpage);
		int totalData = service.getSearchReceiveMailTotalData(searchParam);
		int pageBarSize = 5;
		String url = "/mail/searchmail.do";
		
		String pageBar = paging(totalData, cPage, numPerpage, pageBarSize, url);
		
		List<Mail> searchList = service.searchReceiveMail(searchParam, pagingParam);
		model.addAttribute("mails", searchList);
		model.addAttribute("pageBar", pageBar);
		
		RecentSearch recentSearch = RecentSearch.builder()
												.empNo(empNo)
												.searchType(searchType)
												.searchValue(searchValue)
												.build();
		service.enrollRecentSearchKeyword(recentSearch);
		
		return "mail/mailresponse/search_mail_list";
	}
	
	@GetMapping("/deleterecentsearchhistory.do")
	public @ResponseBody int deleteRecentSearchHistory(String no) {
		System.out.println("no : " + no);
		return service.deleteRecentSearchHistory(no);
	}
	
	@GetMapping("/refreshsearchmodal.do")
	public String refreshSearchModal(Model model) {
		long empNo = getLoginEmpInfo().getEmpNo();
//		List<RecentSearch> searchList = service.getRecentSearch(empNo);
//		model.addAttribute("recentSearch", searchList);
		return "mail/mailresponse/recentsearch_modal";
	}
	
	@GetMapping("/filedownload.do")
	public void fileDownload(HttpServletResponse response, HttpSession session, 
			String mailRenamedFileName,	String mailOriginalFileName) {
		String filePath = session.getServletContext().getRealPath("/resources/upload/mail/");
		File downloadFile = new File(filePath + mailRenamedFileName);
		try(FileInputStream fis = new FileInputStream(downloadFile);
				BufferedInputStream bis = new BufferedInputStream(fis);
					BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream())){
			String encoding = new String(mailOriginalFileName.getBytes("UTF-8"), "ISO-8859-1");
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
	
	@GetMapping("/mailsettingview.do")
	public void mailSettingView(Model model) {
		long empNo = getLoginEmpInfo().getEmpNo();
		
		List<SpamDomain> spamDomains = service.getSpamDomain(empNo);
		System.out.println("spamDomainList : " + spamDomains);
		
		model.addAttribute("spamDomains", spamDomains);
	}
	
	@PostMapping("applymailsetting.do")
	public String applyMailSetting(int numPerpage, String[] spamMailAddress, Model model) {
		long empNo = getLoginEmpInfo().getEmpNo();
		
		Map<String, Object> mailSettingParam = new HashMap<String, Object>();
		System.out.println("settingNumPerpage : " + numPerpage);
		Arrays.stream(spamMailAddress).forEach(e -> {
			System.out.println("spamMailAddressSetting : " + e);
		});
		
		mailSettingParam.put("numPerpage", numPerpage);
		mailSettingParam.put("empNo", empNo);
		
		int spamAddressExistCount = 0;
		for(String address : spamMailAddress) {
			if(address.length() > 0) spamAddressExistCount++;
		}
		
		if(spamAddressExistCount > 0) {
			mailSettingParam.put("spamMailAddressArr", spamMailAddress);			
		}
		
		int result = service.applyMailSetting(mailSettingParam);
		
		return changeMailView(model, 1);
	}
	
	//test
	@GetMapping("/testuploadfile.do")
	public String testUploadFileView() {
		return "mail/fileuploadtest";
	}
	
	//test
	@PostMapping("/testmultipartfile.do")
	public void testUploadFile(MultipartFile[] upFile) {
		if(upFile != null) {
			for(MultipartFile file : upFile) {
				System.out.println("oriName : " + file.getOriginalFilename());
			}
		}
	}
	
	//test
	@GetMapping("/modaltestview.do")
	public String modalTestView() {
		return "mail/modaltest";
	}
	
	private Employee getLoginEmpInfo() {
		return (Employee) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
	}
	
	private void updateRecentReadStatus(int mailNo) {
		service.updateRecentReadStatus(mailNo);
	}
}
