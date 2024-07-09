package com.waait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waait.dto.Mail;
import com.waait.dto.MailSetting;
import com.waait.dto.MyMailBox;
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
	
	public int getTotalData(SqlSession session, Map<String, Object> mailSettings) {
		return session.selectOne("mail.getTotalData", mailSettings);
	}

	public int insertSpamDomain(SqlSession session, Map<String, Object> param) {
		return session.insert("mail.setSpamDomain", param);
	}

	public List<Mail> getAllMail(SqlSession session, String loginMemberEmailDomain) {
		return session.selectList("mail.getAllMail", loginMemberEmailDomain);
	}

	public List<Mail> getSpamMail(SqlSession session, Map<String, Object> param) {
		return session.selectList("mail.getSpamMail", param);
	}

	public void enrollUserMailBox(SqlSession session, Map<String, Object> param) {
		session.selectList("mail.enrollUserMailBox", param);
	}
	
	public int getMyMailBoxSeq(SqlSession session) {
		return session.selectOne("mail.getMyMailBoxSeq");
	}

	public List<MyMailBox> getMyMailBox(SqlSession session, long empNo) {
		return session.selectList("mail.getMyMailBox", empNo);
	}

	public int deleteSpamDomain(SqlSession session, Map<String, Object> param) {
		return session.delete("mail.deleteSpamDomain", param);
	}

	public Mail getMailDetailByNo(SqlSession session, Map<String, Object> param) {
		return session.selectOne("mail.getMailDetailByNo", param);
	}

	public void updateReadStatus(SqlSession session, int mailNo) {
		session.update("mail.updateReadStatus", mailNo);
	}

	public int addFavoriteMail(SqlSession session, String mailNo) {
		return session.update("mail.addFavoriteMail", mailNo);
	}

	public int cancelAddFavorite(SqlSession session, String mailNo) {
		return session.update("mail.cancelAddFavotie", mailNo);
	}

	public int selectSequence(SqlSession session) {
		return session.selectOne("mail.selectMailSequence");
	}
	
	public int enrollSendMailInfo(SqlSession session, Map<String, Object> param) {
		return session.insert("mail.enrollSendMailInfo", param);
	}

	public int enrollReceiverInfo(SqlSession session, Map<String, Object> param) {
		return session.insert("mail.enrollReceiverInfo", param);
	}

	public int addMailMyMailBox(SqlSession session, Map<String, Object> param) {
		return session.insert("mail.addMailMyMailBox", param);
	}

	public List<Mail> joinMyMailBoxDetail(SqlSession session, int myMailBoxNo) {
		return session.selectList("mail.joinMyMailBoxDetail", myMailBoxNo);
	}

	public List<Mail> joinFavoriteMailBox(SqlSession session, String loginMemberEmailDomain) {
		return session.selectList("mail.joinFavoriteMailBox", loginMemberEmailDomain);
	}

	public List<Mail> joinTempoSaveMailBox(SqlSession session, long empNo) {
		return session.selectList("mail.joinTempoSaveMailBox", empNo);
	}

	public Mail joinTempoSaveMailByMailNo(SqlSession session, int mailNo) {
		return session.selectOne("mail.joinTempoSaveMailByMailNo", mailNo);
	}

	public int deleteMail(SqlSession session, String mailNo) {
		return session.update("mail.deleteMail", mailNo);
	}

	public int moveMailToTrashMailBox(SqlSession session, int mailNo) {
		return session.update("mail.moveMailToTrashMailBox", mailNo);
	}

	public int deleteMyMailBox(SqlSession session, int myMailBoxNo) {
		return session.delete("mail.deleteMyMailBox", myMailBoxNo);
	}

	public List<Mail> jointrashmailbox(SqlSession session, String receiverMailAddress) {
		return session.selectList("mail.jointrashmailbox", receiverMailAddress);
	}

	public void perfectlyDeleteMail(SqlSession session, String mailNo) {
		session.delete("mail.perfectlyDeleteMail", mailNo);
	}

	public List<Mail> joinSendingMailBox(SqlSession session, long empNo) {
		return session.selectList("mail.joinSendingMailBox", empNo);
	}



}
