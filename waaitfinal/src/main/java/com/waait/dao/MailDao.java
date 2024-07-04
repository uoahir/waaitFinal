package com.waait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waait.dto.Mail;
import com.waait.dto.MailSetting;
import com.waait.dto.SpamDomain;

@Repository
public class MailDao {

	public List<Mail> getReceiveMail(SqlSession session, Map<String, Object> mailSettings) {
		int cPage = (int) mailSettings.get("cPage");
		int numPerpage = (int) mailSettings.get("numPerpage");
		RowBounds rb = new RowBounds((cPage - 1) * numPerpage, numPerpage);
		return session.selectList("mail.selectReceiveMail", mailSettings, rb);
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

	public void insertSpamDomain(SqlSession session, Map<String, Object> param) {
		session.insert("mail.setSpamDomain", param);
	}

	public List<Mail> getAllMail(SqlSession session, String loginMemberEmailDomain) {
		return session.selectList("mail.getAllMail", loginMemberEmailDomain);
	}

	public List<Mail> getSpamMail(SqlSession session, Map<String, Object> param) {
		return session.selectList("mail.getSpamMail", param);
	}

}
