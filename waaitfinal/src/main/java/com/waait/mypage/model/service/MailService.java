package com.waait.mypage.model.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;

import com.waait.dao.MailDao;
import com.waait.dto.Mail;
import com.waait.dto.SpamDomain;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MailService {
	private final MailDao dao;
	private final SqlSession session;
	
	public List<Mail> getReceiveMail(String mailAddress) {
		return dao.getReceiveMail(session, mailAddress);
	}

	public List<SpamDomain> getSpamDomain(Long empNo) {
		return dao.getSpamDomain(session, empNo);
	}
}
