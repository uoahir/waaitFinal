package com.waait.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.waait.dao.MailDao;
import com.waait.dto.Mail;
import com.waait.dto.MailFile;
import com.waait.dto.MailSetting;
import com.waait.dto.MyMailBox;
import com.waait.dto.RecentSearch;
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

	public MailSetting getMailSetting(Long empNo) {
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
	} //??

	public List<Mail> getSpamMail(Map<String, Object> param) {
		return dao.getSpamMail(session, param);
	}
	
	public int getTotalData(Map<String, Object> mailSettings) {
		return dao.getTotalData(session, mailSettings);
	}

	public int enrollUserMailBox(Map<String, Object> param) {
		int myMailBoxSeq = dao.getMyMailBoxSeq(session);
		param.put("myMailBoxNo", myMailBoxSeq);
		dao.enrollUserMailBox(session, param);
		return myMailBoxSeq;
	}

	public List<MyMailBox> getMyMailBox(long empNo) {
		return dao.getMyMailBox(session, empNo);
	}
	
	@Transactional
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
	
	@Transactional
	public void updateReceiverReadStatus(Map<String, Object> sqlParam) {
		dao.updateReceiverReadStatus(session, sqlParam);
	}
	
	public void updateRecentReadStatus(int mailNo) {
		dao.updateRecentReadStatus(session, mailNo);
	}
	
	@Transactional
	public int addFavoriteMail(String mailNo) {
		int result = 0;
		if(mailNo.contains(",")) {
			String[] mailNoArr = mailNo.split(",");
			for(int i = 0; i < mailNoArr.length; i++) {
				System.out.println("mailNo 배열 : " + mailNoArr[i]);
				result = dao.addFavoriteMail(session, mailNoArr[i]);
				if(result == 0) return result;
			}
		} else {
			return dao.addFavoriteMail(session, mailNo);			
		}
		return result;
	}

	public int cancelAddFavorite(String mailNo) {
		return dao.cancelAddFavorite(session, mailNo);
	}
	
	@Transactional
	public int sendMail(Map<String, Object> param) {
		int checkCount = 0;
		int result = 0;
		int mailSequence = dao.selectSequence(session);
		System.out.println("mailSequence : " + mailSequence);
		param.put("mailNo", mailSequence);
		
		dao.enrollSendMailInfo(session, param);
		
		String[] mailReceiverAddressArr = (String[]) param.get("mailReceiverAddress");
		System.out.println("MailReceiverAddressArrLength : " + mailReceiverAddressArr.length);
		
		for(String receiverAddress : mailReceiverAddressArr) {
			if(receiverAddress.length() > 0) checkCount++;
		}
		
		if(checkCount == 1) {
			for(String receiverAddress : mailReceiverAddressArr) {
				if(receiverAddress.length() > 0) param.put("mailReceiverAddress", receiverAddress);
			}
		}
		
		if(mailReceiverAddressArr.length > 1) {
			for(int i = 0; i < mailReceiverAddressArr.length; i++) {
				if(mailReceiverAddressArr[i].length() != 0) {
					param.put("mailReceiverAddress", mailReceiverAddressArr[i]);
					result = dao.enrollReceiverInfo(session, param);
				}
			}
		} else {
			result = dao.enrollReceiverInfo(session, param);
		}
 		return mailSequence;
	}
	
	@Transactional
	public int addMailMyMailBox(Map<String, Object> param) {
		int result = 0;
		String mailNoStr = (String) param.get("mailNoStr");
		
		if(mailNoStr.contains(",")) {
			String[] mailNoArr = mailNoStr.split(",");
			for(int i = 0; i < mailNoArr.length; i++) {
				param.put("mailNoStr", mailNoArr[i]);
				result = dao.addMailMyMailBox(session, param);
			}
		} else {
			result = dao.addMailMyMailBox(session, param);
		}
		return result;
	}

	public List<Mail> joinMyMailBoxDetail(int myMailBoxNo, Map<String, Integer> pagingParam) {
		return dao.joinMyMailBoxDetail(session, myMailBoxNo, pagingParam);
	}
	
	public int getMyMailBoxTotalData(int myMailBoxNo) {
		return dao.getMyMailBoxTotalData(session, myMailBoxNo);
	}
	
	public int getFavoriteMailTotalData(String loginMemberEmailDomain) {
		return dao.getFavoriteMailTotalData(session, loginMemberEmailDomain);
	}
	
	public List<Mail> joinFavoriteMailBox(String loginMemberEmailDomain) {
		return dao.joinFavoriteMailBox(session, loginMemberEmailDomain);
	}

	public List<Mail> joinTempoSaveMailBox(long empNo) {
		return dao.joinTempoSaveMailBox(session, empNo);
	}
	
	public int getTempoSaveMailTotalData(long empNo) {
		return dao.getTempoSaveMailTotalData(session, empNo);
	}

	public Mail joinTempoSaveMailByMailNo(int mailNo) {
		return dao.joinTempoSaveMailByMailNo(session, mailNo);
	}

	public int deleteMail(String mailNoStr) {
		int result = 0;
		if(mailNoStr.contains(",")) {
			String[] mailNoArr = mailNoStr.split(",");
			for(int i = 0; i < mailNoArr.length; i++) {
				result = dao.deleteMail(session, mailNoArr[i]);
			}
		} else {
			result = dao.deleteMail(session, mailNoStr);			
		}
		return result;
	} //안쓸지도?
	
	@Transactional
	public int deleteReceiveMail(Map<String, Object> sqlParam) {
		return dao.deleteReceiveMail(session, sqlParam);
	}
	
	@Transactional
	public int deleteSendingMail(int mailNo) {
		return dao.deleteSendingMail(session, mailNo);
	}
	
//	@Transactional
//	public int deleteMailSendToMe(int mailNo) {
//		return dao.deleteMailSendToMe(session, mailNo);
//	} 모르겠다
	
	
	@Transactional
	public int moveMailToTrashMailBox(List<Mail> mailInMyMailBox) {
		int result = 0;
		for(Mail mail : mailInMyMailBox) {
			result = dao.moveMailToTrashMailBox(session, mail.getMailNo());
		}
		return result;
		
	}
	
	@Transactional
	public int deleteMyMailBox(int myMailBoxNo) {
		return dao.deleteMyMailBox(session, myMailBoxNo);
	}

	public List<Mail> jointrashmailbox(String mailAddress, Map<String, Integer> pagingParam) {
		return dao.jointrashmailbox(session, mailAddress, pagingParam);
	}
	
	@Transactional
	public void senderPerfectlyDeleteMail(int mailNo) {
		dao.senderPerfectlyDeleteMail(session, mailNo);
	}
	
	public void receiverPerfectlyDeleteMail(Map<String, String> deleteSqlParam) {
		dao.receiverPerfectlyDeleteMail(session, deleteSqlParam);
	}
	
	public int senderRestoreMail(int mailNo) {
		return dao.senderRestoreMail(session, mailNo);
	}
	
	public int receiverRestoreMail(Map<String, Object> restoreSqlParam) {
		return dao.receiverRestoreMail(session, restoreSqlParam);
	}
	
	public List<Mail> getMailForDelete(String mailNoStr) {
		List<Mail> getMailForDelete = new ArrayList<Mail>();
		if(mailNoStr.contains(",")) {
			String[] mailNoArr = mailNoStr.split(",");
			for(int i = 0; i < mailNoArr.length; i++) {
				getMailForDelete.add(dao.getMailForDelete(session, mailNoArr[i]));
			}
		} else {
			System.out.println("일단 else문이냐?");
			getMailForDelete.add(dao.getMailForDelete(session, mailNoStr));
		}
		return getMailForDelete;
	}
	
	public List<Mail> getTrashMailForRestore(String mailNoStr) {
		List<Mail> trashMailListByMailNo = new ArrayList<Mail>();
		if(mailNoStr.contains(",")) {
			String[] mailNoArr = mailNoStr.split(",");
			for(int i = 0; i < mailNoArr.length; i++) {
				trashMailListByMailNo.add(dao.getTrashMailByMailNoForRestore(session, mailNoArr[i]));
			}
		} else {
			trashMailListByMailNo.add(dao.getTrashMailByMailNoForRestore(session, mailNoStr));	
		}
		return trashMailListByMailNo;
	}

	public List<Mail> joinSendingMailBox(long empNo, Map<String, Integer> pagingParam) {
		return dao.joinSendingMailBox(session, empNo, pagingParam);
	}

	public List<Mail> searchReceiveMail(Map<String, Object> searchParam, Map<String, Integer> pagingParam) {
		return dao.searchReceiveMail(session, searchParam, pagingParam);
	}
	
	@Transactional
	public int updateFile(MailFile mailFile) {
		return dao.updateFile(session, mailFile);
	}
	
	@Transactional
	public void enrollRecentSearchKeyword(RecentSearch recentSearch) {
		dao.enrollRecentSearchKeyword(session, recentSearch);
	}

	public int joinSendingMailBoxTotalData(long empNo) {
		return dao.joinSendingMailBoxData(session, empNo);
	}

	public int trashMailBoxTotalData(String receiverMailAddress) {
		return dao.trashMailBoxTotalData(session, receiverMailAddress);
	}

	public int notReadDataCount(Map<String, Object> mailSettings) {
		return dao.notReadDataCount(session, mailSettings);
	}

	public int getSpamMailCount(Map<String, Object> param) {
		return dao.getSpamMailCount(session, param);
	}

	public int getSearchReceiveMailTotalData(Map<String, Object> searchParam) {
		return dao.getSearchReceiveMailTotalData(session, searchParam);
	}
	
	@Transactional
	public int applyMailSetting(Map<String, Object> mailSettingParam) {
		int result = 0;
		if(mailSettingParam.containsKey("spamMailAddressArr")) {
			String[] spamMailAddressArr = (String[]) mailSettingParam.get("spamMailAddressArr");
			for(String spamMailAddress : spamMailAddressArr) {
				if(spamMailAddress.length() > 0) {
					mailSettingParam.put("spamMailAddress", spamMailAddress);
					result = dao.settingSpamMailAddress(session, mailSettingParam);
				}
			}
		}
		
		result = dao.settingNumPerpage(session, mailSettingParam);
		return result;
	}

	public List<RecentSearch> getRecentSearch(long empNo) {
		return dao.getRecentSearch(session, empNo);
	}




}
