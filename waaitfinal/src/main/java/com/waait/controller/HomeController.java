package com.waait.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.Map;

import org.springframework.cglib.core.Local;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.waait.dto.Employee;
import com.waait.dto.Work;
import com.waait.service.EmployeeService;
import com.waait.service.WorkService;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {

	private final EmployeeService employeeService;
	private final BCryptPasswordEncoder encoder;
	private final WorkService workService;

	@GetMapping("/login")
	public String loginForm() {
		System.out.println("/loginPage");

		return "login";
	}


	@GetMapping("/user")
	public String homeForm(HttpSession session) {
		
		return "home";

	}
	@PostMapping("/insertemp")
	public String testInsertEmp(Employee e) {
		System.out.println("이름:" + e.getEmpName());
		System.out.println("아이디:" + e.getEmpId());
		System.out.println("비밀번호:" + e.getEmpPwd());
		Employee employee = e.builder().empId(e.getEmpId()).empName(e.getEmpName())
				.empPwd(encoder.encode(e.getEmpPwd())).build();
		employeeService.insertEmployee(employee);
		return "redirect:/user";
	}
	@GetMapping("/") //화면에 데이터 출력부분
	public String homeController(Model model) {
		
		Employee employee = (Employee)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		Map<String, String> param = new HashMap<>();
		LocalDateTime now = LocalDateTime.now();
		Timestamp timestamp = Timestamp.valueOf(now);
		System.out.println("20"+(timestamp.getYear()%100)+"-"+(timestamp.getMonth()+1)+"-"+(timestamp.getDate()));
		String today = "20"+(timestamp.getYear()%100)+"-"+(timestamp.getMonth()+1)+"-"+(timestamp.getDate());
		param.put("today", today);
		param.put("empNo",""+employee.getEmpNo());
		
		Work work = workService.selectByEmpNoWork(param);
		
		model.addAttribute("work",work);
					
		return "index";
	}
	//----------------------------------------------------------------------------------
	@GetMapping("/accountprofile")
	public String accountProfile() {
		System.out.println("dd");
		return "account-profile";
	} // check
	@GetMapping("/accountsecurity")
	public String accountSecurity() {
		System.out.println("시큐리티 페이지");
		return "account-security"; //솔민, 요한 - 인사
	}// check
	@GetMapping("/applicationchat")
	public String appliCationchat () {
		System.out.println("어플리케이션 채팅");
	return "application-chat";
	} //check
	@GetMapping("/applicationcheckout")
	public String applicationCheckout () {
		System.out.println("어플리케이션 체크아웃");
	return "application-checkout";
	}
	@GetMapping("/applicationemail")
	public String applicationEmail () {
		System.out.println("application-email");
	return "application-email"; //솔민,지연연- 이메일
	}
	@GetMapping("/applicationgallery")
	public String applicationGallery () {
		System.out.println("application-gallery");
	return "application-gallery"; //화면이니까 페이지 언더바 중간에 껴음
	}
	@GetMapping("/authforgotpassword")
	public String authForgotPassword () {
		System.out.println("auth-forgot-password");
	return "auth-forgot-password"; //솔민,요한 - 인사
	}
	@GetMapping("/authlogin")
	public String authLogin () {
		System.out.println("auth-login");
	return "auth-login"; //화면이니까 페이지 언더바 중간에 껴음
	}
	@GetMapping("/authregister")
	public String authRegister() {
		System.out.println("auth-register");
	return "auth-register"; //화면이니까 페이지 언더바 중간에 껴음
	}
	@GetMapping("/componentaccordion")
	public String componentAccordion() {
		System.out.println("component-accordion");
	return "component-accordion"; //화면이니까 페이지 언더바 중간에 껴음
	}
	@GetMapping("/componentalert")
	public String componentAlert() {
		System.out.println("component-alert");
	return "component-alert"; //화면이니까 페이지 언더바 중간에 껴음
	}
	@GetMapping("/componentbadge")
	public String componentBadge() {
		System.out.println("component-badge");
	return "component-badge"; //화면이니까 페이지 언더바 중간에 껴음
	}
	@GetMapping("/componentbreadcrumb")
	public String componentBreadcrumb() {
		System.out.println("component-breadcrumb");
	return "component-breadcrumb"; //화면이니까 페이지 언더바 중간에 껴음
	}
	@GetMapping("/componentbutton")
	public String componentButton() {
		System.out.println("component-button");
	return "component-button"; //화면이니까 페이지 언더바 중간에 껴음
	}
	@GetMapping("/componentcard")
	public String componentCard() {
		System.out.println("component-card");
	return "component-card"; //화면이니까 페이지 언더바 중간에 껴음
	}
	@GetMapping("/componentcarousel")
	public String componentCarousel() {
		System.out.println("component-carousel");
	return "component-carousel"; //화면이니까 페이지 언더바 중간에 껴음
	}
	@GetMapping("/componentcollapse")
	public String componentCollapse() {
		System.out.println("component-collapse");
	return "component-collapse"; //화면이니까 페이지 언더바 중간에 껴음
	}
	@GetMapping("/componentdropdown")
	public String componentDropdown () {
		System.out.println("component-dropdown");
	return "component-dropdown"; //화면이니까 페이지 언더바 중간에 껴음
	}
	@GetMapping("/componentlistgroup")
	public String componentListGroup () {
		System.out.println("component-list-group");
	return "component-list-group"; //화면이니까 페이지 언더바 중간에 껴음
	}
	@GetMapping("/componentmodal")
	public String componentModal() {
		System.out.println("component-modal");
	return "component-modal"; //화면이니까 페이지 언더바 중간에 껴음
	}
	@GetMapping("/componentnavs")
	public String componentNavs() {
		System.out.println("component-navs");
	return "component-navs"; //화면이니까 페이지 언더바 중간에 껴음
	}
	@GetMapping("/componentpagination")
	public String componentPagination() {
		System.out.println("component-pagination");
	return "component-pagination"; //화면이니까 페이지 언더바 중간에 껴음
	}
	@GetMapping("/componentplaceholder")
	public String componentPlaceholder() {
		System.out.println("component-placeholder");
	return "component-placeholder"; //화면이니까 페이지 언더바 중간에 껴음
	}
	@GetMapping("/componentprogress")
	public String componentProgress() {
		System.out.println("component-progress");
	return "component-progress"; //바같은 체킹
	}
	@GetMapping("/componentspinner")
	public String componentSpinner() {
		System.out.println("component-spinner");
	return "component-spinner"; //로딩 페이지 
	}
	@GetMapping("/componenttoasts")
	public String componentToasts() {
		System.out.println("component-toasts");
	return "component-toasts"; //로딩 페이지 
	}
	@GetMapping("/componenttooltip")
	public String componentTooltip() {
		System.out.println("component-tooltip");
	return "component-tooltip"; //로딩 페이지 
	}
	@GetMapping("/error403")
	public String error403() {
		System.out.println("error-403");
	return "error-403"; //에러 403 페이지 
	}

	@GetMapping("/error404")
	public String error404() {
		System.out.println("error-404");
	return "error-404"; //에러 404 페이지 
	}
	@GetMapping("/error500")
	public String error500() {
		System.out.println("error-500");
	return "error-500"; //에러 500 페이지 
	}
	@GetMapping("/extracomponentavatar")
	public String extraComponentAvatar() {
		System.out.println("extra-component-avatar");
	return "extra-component-avatar"; // 지희,솔민 - 프로필 
	}
	@GetMapping("/extracomponentcomment")
	public String extraComponentComment() {
		System.out.println("extra-component-comment");
	return "extra-component-comment"; //팀에 대한 논평에 대한부분
	}
	@GetMapping("/extracomponentdatepicker")
	public String extraComponentDatePicker() {
		System.out.println("extra-component-date-picker");
	return "extra-component-date-picker"; //지희 - 달력
	}
	
	@GetMapping("/extracomponentdivider")
	public String extraComponentDivider() {
		System.out.println("extra-component-divider");
	return "extra-component-divider"; //(x)
	}	
	
	@GetMapping("/extracomponentflag")
	public String extraComponentFlag() {
		System.out.println("extra-component-flag");
	return "extra-component-flag"; //국기 (x)
	}
	@GetMapping("extracomponentrating")
	public String extraComponentRating() {
		System.out.println("extra-component-rating");
	return "extra-component-rating"; // 별점 
	}	
	@GetMapping("extracomponentsweetalert")
	public String extraComponentSweetalert() {
		System.out.println("extra-component-sweetalert");
	return "extra-component-sweetalert"; // 버튼 컨퍼넌트 
	}
	@GetMapping("extracomponenttoastify")
	public String extraComponentToastify() {
		System.out.println("extra-component-toastify");
	return "extra-component-toastify"; // 버튼 컨퍼넌트 
	}
	@GetMapping("formeditorckeditor")
	public String formEditorCkeditor() {
		System.out.println("form-editor-ckeditor");
	return "form-editor-ckeditor"; // 솔민,지연 - 텍스트 편집기 1
	}
	@GetMapping("formeditorquill")
	public String formEditorQuill() {
		System.out.println("form-editor-quill");
	return "form-editor-quill"; // 솔민,지연 - 텍스트 편집기 2
	}
	@GetMapping("formeditorsummernote")
	public String formEditorSummernote() {
		System.out.println("form-editor-summernote");
	return "form-editor-summernote"; // 솔민,지연 - 텍스트 편집기 3
	}
	@GetMapping("formeditortinymce")
	public String formEditorTinymce() {
		System.out.println("form-editor-tinymce");
	return "form-editor-tinymce"; // 솔민,지연 - 텍스트 편집기 4
	}
	@GetMapping("formelementcheckbox")
	public String formElementCheckbox() {
		System.out.println("form-element-checkbox");
	return "form-element-checkbox"; // 공용 - 체크박스
	}
	@GetMapping("formelementinputgroup")
	public String formElementInputGroup() {
		System.out.println("form-element-input-group");
	return "form-element-input-group"; // 공용 - 입력, 버튼,파일업로드 1 
	}
	@GetMapping("formelementinput")
	public String formElementInput() {
		System.out.println("form-element-input");
	return "form-element-input"; // 공용 - 입력, 버튼,파일업로드 2
	}
	@GetMapping("formelementradio")
	public String formElementRadio() {
		System.out.println("form-element-radio");
	return "form-element-radio"; // 공용 - 라디오버튼
	}
	@GetMapping("formelementselect")
	public String formElementSelect() {
		System.out.println("form-element-select");
	return "form-element-select"; // 공용 - select 
	}
	@GetMapping("formelementtextarea")
	public String formElementTextarea() {
		System.out.println("form-element-textarea");
	return "form-element-textarea"; // 공용 - textarea 
	}
	@GetMapping("formlayout")
	public String formLayout() {
		System.out.println("form-layout");
	return "form-layout"; // 공용 - form-tag lay out 
	}
	@GetMapping("formvalidationparsley")
	public String formValidationParsley() {
		System.out.println("form-validation-parsley");
	return "form-validation-parsley"; // 지연,요한- 양식검증 
	}
	@GetMapping("layoutdefault")
	public String layoutDefault() {
		System.out.println("layout-default");
	return "layout-default"; // (X)
	}
	@GetMapping("layouthorizontal")
	public String layoutHorizontal() {
		System.out.println("layout-horizontal");
	return "layout-horizontal"; // 중요  
	}
	@GetMapping("layoutrtlbackup")
	public String layoutRtlBackup() {
		System.out.println("layout-rtl-backup");
	return "layout-rtl-backup"; // 중요  
	}
	@GetMapping("layoutrtl")
	public String layoutRtl() {
		System.out.println("layout-rtl");
	return "layout-rtl"; // 중요  
	}
	@GetMapping("layoutvertical1column")
	public String layoutvertical1column() {
		System.out.println("layout-vertical-1-column");
	return "layout-vertical-1-column"; // (x)  
	}
	@GetMapping("layoutverticalnavbar")
	public String layoutVerticalNavbar() {
		System.out.println("layout-vertical-navbar");
	return "layout-vertical-navbar"; // (x)  
	}
	@GetMapping("tabledatatablejquery")
	public String tableDatatableJquery() {
		System.out.println("table-datatable-jquery");
	return "table-datatable-jquery"; // 공용 - 데이터 테이블
	}
	@GetMapping("tabledatatable")
	public String tableDatatable() {
		System.out.println("table-datatable");
	return "table-datatable"; // 공용, 지연, 솔민 - 테이블 
	}
	@GetMapping("table")
	public String table() {
		System.out.println("table");
	return "table"; // 공용, 솔민 - 테이블 2 
	}
	@GetMapping("uichartapexcharts")
	public String uiChartApexcharts() {
		System.out.println("ui-chart-apexcharts");
	return "ui-chart-apexcharts"; // 요한 -차트 그래프 1 
	}
	@GetMapping("uichartchartjs")
	public String uiChartChartjs() {
		System.out.println("ui-chart-chartjs");
	return "ui-chart-chartjs"; // 요한 -차트 그래프  2
	}
	@GetMapping("uifileuploader")
	public String uiFileUploader() {
		System.out.println("ui-file-uploader");
	return "ui-file-uploader"; // 지연,솔민,요한 - 파일 드래그 드랍 2
	}
	/*
	 * @GetMapping("uiiconsbootstrapicons") public String uiIconsBootstrapIcons() {
	 * System.out.println("ui-icons-bootstrap-icons"); return
	 * "ui-icons-bootstrap-icons"; }
	  18,000LINE  공용 - 아이콘
	 */  
	@GetMapping("uiiconsdripicons")
	public String uiIconsDripicons() {
		System.out.println("ui-icons-dripicons");
	return "ui-icons-dripicons"; // 공용 - 아이콘
	}
	/*
	 * @GetMapping("uiiconsfontawesome") public String uiIconsFontawesome() {
	 * System.out.println("ui-icons-fontawesome"); return "ui-icons-fontawesome"; //
	 * 공용 - 아이콘 // byte 문제 실행 지금 안됨 }
	 */
	@GetMapping("uimapgooglemap")
	public String uiMapGoogleMap() {
		System.out.println("ui-map-google-map");
	return "ui-map-google-map"; // 공용-구글맵 회사 정보1
	}
	@GetMapping("uimapjsvectormap")
	public String uiMapJsvectormap() {
		System.out.println("ui-map-jsvectormap");
	return "ui-map-jsvectormap"; // 공용-구글맵 회사 정보2
	}
	@GetMapping("uimultilevelmenu")
	public String uiMultiLevelMenu() {
		System.out.println("ui-multi-level-menu");
	return "ui-multi-level-menu"; // (x)
	}
	@GetMapping("uiwidgetschatbox")
	public String uiWidgetsChatbox() {
		System.out.println("ui-widgets-chatbox");
	return "ui-widgets-chatbox"; // 주환 - 채팅
	}
	@GetMapping("uiwidgetspricing")
	public String uiWidgetsPricing() {
		System.out.println("ui-widgets-pricing");
	return "ui-widgets-pricing"; // (x)
	}
	@GetMapping("uiwidgetstodolist")
	public String uiWidgetsTodolist() {
		System.out.println("ui-widgets-todolist");
	return "ui-widgets-todolist"; // 지희,오한 - todolist
	}


	

}
