package com.waait.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waait.dto.Mail;
import com.waait.dto.SpamDomain;

@Repository
public class MailDao {

	public List<Mail> getReceiveMail(SqlSession session, String mailAddress) {
		 return session.selectList("mail.selectReceiveMail", mailAddress);
	}

	public List<SpamDomain> getSpamDomain(SqlSession session, Long empNo) {
		
	}

}
