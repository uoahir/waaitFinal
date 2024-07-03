package com.waait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waait.dto.Mail;
import com.waait.dto.MailSetting;
import com.waait.dto.SpamDomain;

@Repository
public class MailDao {

	public List<Mail> getReceiveMail(SqlSession session, Map<String, Object> mailSettings) {
		 return session.selectList("mail.selectReceiveMail", mailSettings);
	}

	public List<SpamDomain> getSpamDomain(SqlSession session, long empNo) {
		return session.selectList("mail.selectSpamDomainAddress", empNo);
	}

	public List<MailSetting> getMailSetting(SqlSession session, long empNo) {
		return session.selectList("mail.selectMailSetting", empNo);
	}

	public void setMailSetting(SqlSession session, long empNo) {
		session.insert("mail.setMailSetting", empNo);
	}

}
