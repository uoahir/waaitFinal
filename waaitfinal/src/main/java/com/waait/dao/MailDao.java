package com.waait.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.waait.dto.Mail;
import com.waait.dto.MailFile;
import com.waait.dto.MailSetting;
import com.waait.dto.MyMailBox;
import com.waait.dto.RecentSearch;
import com.waait.dto.SpamDomain;

@Repository
public class MailDao {
	
	public RowBounds getRowBounds(Map<String, Integer> pagingParam) {
		int cPage = pagingParam.get("cPage");
		int numPerpage = pagingParam.get("numPerpage");
		RowBounds rb = new RowBounds((cPage - 1) * numPerpage, numPerpage);
		return rb;
	}
	
	public List<Mail> getReceiveMail(SqlSession session, Map<String, Object> mailSettings) {
		int cPage = (int) mailSettings.get("cPage");
		int numPerpage = (int) mailSettings.get("numPerpage");
		RowBounds rb = new RowBounds((cPage - 1) * numPerpage, numPerpage);
		return session.selectList("mail.selectReceiveMail", mailSettings, rb);
	}

	public List<SpamDomain> getSpamDomain(SqlSession session, long empNo) {
		return session.selectList("mail.selectSpamDomainAddress", empNo);
	}

	public MailSetting getMailSetting(SqlSession session, long empNo) {
		return session.selectOne("mail.selectMailSetting", empNo);
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
	} //??

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

	public void updateReceiverReadStatus(SqlSession session, Map<String, Object> sqlParam) {
		session.update("mail.updateReceiverReadStatus", sqlParam);
	}
	
	public void updateRecentReadStatus(SqlSession session, int mailNo) {
		session.update("mail.updateRecentReadStatus", mailNo);
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
	
	public int getMyMailBoxTotalData(SqlSession session, int myMailBoxNo) {
		return session.selectOne("mail.getMyMailBoxTotalData", myMailBoxNo);
	}

	public List<Mail> joinMyMailBoxDetail(SqlSession session, int myMailBoxNo, Map<String, Integer> pagingParam) {
		if(pagingParam != null) {
			RowBounds rb = getRowBounds(pagingParam);
			return session.selectList("mail.joinMyMailBoxDetail", myMailBoxNo, rb);			
		} else {
			return session.selectList("mail.getAllMyMailBoxDetail", myMailBoxNo);
		}
	}
	
	public int getFavoriteMailTotalData(SqlSession session, String loginMemberEmailDomain) {
		return session.selectOne("mail.getFavoriteMailTotalData", loginMemberEmailDomain);
	}
	
	public List<Mail> joinFavoriteMailBox(SqlSession session, String loginMemberEmailDomain) {
		return session.selectList("mail.joinFavoriteMailBox", loginMemberEmailDomain);
	}

	public List<Mail> joinTempoSaveMailBox(SqlSession session, long empNo) {
		return session.selectList("mail.joinTempoSaveMailBox", empNo);
	}
	
	public int getTempoSaveMailTotalData(SqlSession session, long empNo) {
		return session.selectOne("mail.getTempoSaveMailTotalData", empNo);
	}

	public Mail joinTempoSaveMailByMailNo(SqlSession session, int mailNo) {
		return session.selectOne("mail.joinTempoSaveMailByMailNo", mailNo);
	}

	public int deleteMail(SqlSession session, String mailNo) {
		return session.update("mail.deleteMail", mailNo);
	}
	
	public int deleteReceiveMail(SqlSession session, Map<String, Object> sqlParam) {
		return session.update("mail.deleteReceiveMail", sqlParam);
	}
	
	public int deleteSendingMail(SqlSession session, int mailNo) {
		return session.update("mail.deleteSendingMail", mailNo);
	}
	
	public int deleteMailSendToMe(SqlSession session, int mailNo) {
		return session.update("mail.deleteMailSendToMe", mailNo);
	}
	
	public Mail getTrashMailByMailNoForRestore(SqlSession session, String mailNo) {
		return session.selectOne("mail.getTrashMailForRestore", mailNo);
	}

	public int moveMailToTrashMailBox(SqlSession session, int mailNo) {
		return session.update("mail.moveMailToTrashMailBox", mailNo);
	}

	public int deleteMyMailBox(SqlSession session, int myMailBoxNo) {
		return session.delete("mail.deleteMyMailBox", myMailBoxNo);
	}

	public List<Mail> jointrashmailbox(SqlSession session, String mailAddress, Map<String, Integer> pagingParam) {
		RowBounds rb = getRowBounds(pagingParam);
		return session.selectList("mail.jointrashmailbox", mailAddress, rb);
	}

	public void senderPerfectlyDeleteMail(SqlSession session, int mailNo) {
		session.update("mail.senderPerfectlyDeleteMail", mailNo);
	}
	
	public void deleteAllMailInfo(SqlSession session, int mailNo) {
		session.delete("mail.deleteAllMailInfo", mailNo);
	}
	
	public void receiverPerfectlyDeleteMail(SqlSession session, Map<String, String> deleteSqlParam) {
		session.delete("mail.receiverPerfectlyDeleteMail", deleteSqlParam);
	}
	
	public int senderRestoreMail(SqlSession session, int mailNo) {
		return session.update("mail.senderRestoreMail", mailNo);
	}
	
	public int receiverRestoreMail(SqlSession session, Map<String, Object> restoreSqlParam) {
		return session.update("mail.receiverRestoreMail", restoreSqlParam);
	}
	
	public Mail getMailForDelete(SqlSession session, String mailNoStr) {
		return session.selectOne("mail.getMailForDelete", mailNoStr);
	}

	public List<Mail> joinSendingMailBox(SqlSession session, long empNo, Map<String, Integer> pagingParam) {
		RowBounds rb = getRowBounds(pagingParam);
		return session.selectList("mail.joinSendingMailBox", empNo, rb);
	}

	public List<Mail> searchReceiveMail(SqlSession session, Map<String, Object> searchParam, Map<String, Integer> pagingParam) {
		RowBounds rb = getRowBounds(pagingParam);
		return session.selectList("mail.searchReceiveMail", searchParam, rb);
	}

	public int updateFile(SqlSession session, MailFile mailFile) {
		return session.insert("mail.updateFile", mailFile);
	}

	public void enrollRecentSearchKeyword(SqlSession session, RecentSearch recentSearch) {
		session.insert("mail.enrollRecentSearchKeyword", recentSearch);
	}
	
	public int deleteRecentSearchHistory(SqlSession session, String no) {
		return session.delete("mail.deleteRecentSearchHistory", no);
	}

	public int joinSendingMailBoxData(SqlSession session, long empNo) {
		return session.selectOne("mail.joinSendingMailBoxTotalData", empNo);
	}

	public int trashMailBoxTotalData(SqlSession session, String receiverMailAddress) {
		return session.selectOne("mail.trashMailBoxTotalData", receiverMailAddress);
	}

	public int notReadDataCount(SqlSession session, Map<String, Object> mailSettings) {
		return session.selectOne("mail.notReadDataCount", mailSettings);
	}

	public int getSpamMailCount(SqlSession session, Map<String, Object> param) {
		return session.selectOne("mail.getSpamMailCount", param);
	}

	public int getSearchReceiveMailTotalData(SqlSession session, Map<String, Object> searchParam) {
		return session.selectOne("mail.getSearchReceiveMailTotalData", searchParam);
	}

	public int settingSpamMailAddress(SqlSession session, Map<String, Object> mailSettingParam) {
		return session.insert("mail.settingSpamMailAddress", mailSettingParam);
	}

	public int settingNumPerpage(SqlSession session, Map<String, Object> mailSettingParam) {
		return session.update("mail.settingNumPerpage", mailSettingParam);
	}

	public List<RecentSearch> getRecentSearch(SqlSession session, long empNo) {
		return session.selectList("mail.getRecentSearch", empNo);
	}


}
