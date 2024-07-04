package com.waait.mypage.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.waait.dao.MailDao;
import com.waait.dto.Mail;
import com.waait.dto.MailSetting;
import com.waait.dto.MyMailBox;
import com.waait.dto.SpamDomain;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MailService {
	private final MailDao dao;
	private final SqlSession session;
	
	public List<Mail> getReceiveMail(Map<String, Object> mailSettings) {
		return dao.getReceiveMail(session, mailSettings);
	}

	public List<SpamDomain> getSpamDomain(long empNo) {
		return dao.getSpamDomain(session, empNo);
	}

	public List<MailSetting> getMailSetting(Long empNo) {
		return dao.getMailSetting(session, empNo);
	}

	public void setMailSetting(long empNo) {
		dao.setMailSetting(session, empNo);
	}

	public int insertSpamDomain(Map<String, Object> param) {
		return dao.insertSpamDomain(session, param);
	}

	public List<Mail> getAllMail(String loginMemberEmailDomain) {
		return dao.getAllMail(session, loginMemberEmailDomain);
	}

	public List<Mail> getSpamMail(Map<String, Object> param) {
		return dao.getSpamMail(session, param);
	}

	public void enrollUserMailBox(Map<String, Object> param) {
		dao.enrollUserMailBox(session, param);
	}

	public List<MyMailBox> getMyMailBox(long empNo) {
		return dao.getMyMailBox(session, empNo);
	}

	public int deleteSpamDomain(Map<String, Object> param) {
		int result = 0;
		String[] domainAddressArr = ((String) param.get("domainAddresses")).split(",");
		for(String domainAddress : domainAddressArr) {
			param.put("domainAddress", domainAddress);
			result = dao.deleteSpamDomain(session, param);
			if(result == 0) return result;
		}
		return result;
	}

	public Mail getMailDetailByNo(Map<String, Object> param) {
		return dao.getMailDetailByNo(session, param);
	}

	public void updateReadStatus(int mailNo) {
		dao.updateReadStatus(session, mailNo);
	}

	public int addFavoriteMail(int mailNo) {
		return dao.addFavoriteMail(session, mailNo);
	}
}
