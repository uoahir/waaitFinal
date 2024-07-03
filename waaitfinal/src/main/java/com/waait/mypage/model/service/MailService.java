package com.waait.mypage.model.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.waait.dao.MailDao;
import com.waait.dto.Mail;
import com.waait.dto.MailSetting;
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
}
