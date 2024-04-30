package kr.kh.team1.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.kh.team1.dao.MemberDAO;
import kr.kh.team1.model.dto.LoginDTO;
import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.pagination.Criteria_member;

@Service 
public class MemberServiceImp implements MemberService { 
	
	@Autowired
	MemberDAO memberDao;
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	private boolean checkString(String str) {
		return str != null && str.length() != 0;
	}

	@Override
	public boolean signup(MemberVO member) {
		if(!checkString(member.getMe_id()) ||
		   !checkString(member.getMe_pw()) ||
		   !checkString(member.getMe_pw2()) ||
		   !checkString(member.getMe_email()) ||
		   !checkString(member.getMe_gender()) ||
		   !checkString(member.getMe_name()) ||
		   !checkString(member.getMe_phone()) ||
		   !checkString(member.getMe_addr())) {
			return false;
		}
		
		if(!(member.getMe_pw().equals(member.getMe_pw2()))) {
			return false;
		}
		
		String encPwString = passwordEncoder.encode(member.getMe_pw());
		member.setMe_pw(encPwString);
		
		memberDao.insertMember(member);
		
		return true;
	}

	@Override
	public MemberVO login(LoginDTO loginDto) {
		if(loginDto==null ||
		   !checkString(loginDto.getId()) || //null 체크
		   !checkString(loginDto.getPw())) {
			return null;
		}
		
		MemberVO user = memberDao.selectMember(loginDto.getId()); //아이디 확인
		if(user==null) {
			return null;
		}
		
		if(passwordEncoder.matches(loginDto.getPw(), user.getMe_pw())) { //비밀번호 확인
			return user;
		}
		
		return null;
		
	}

	@Override
	public boolean idCheck(String id) {
		MemberVO member = memberDao.selectMember(id);
		return member == null;
	}

	@Override
	public boolean emailCheck(String email) {
		MemberVO member = memberDao.selectMemberEmail(email);
		return member == null;
	}

	@Override
	public boolean phoneCheck(String phone) {
		MemberVO member = memberDao.selectMemberPhone(phone);
		return member == null;
	}

	@Override
	public boolean birthCheck(String birth) { //0번지 년, 1번지 월, 2번지 일
		if(!checkString(birth)) {
			return false;
		}
		
		LocalDate nowDate = LocalDate.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		String formatedNow = nowDate.format(formatter);
		String[] nowTmp = formatedNow.split("-"); //현재 시간
		String[] birthTmp = birth.split("-"); //입력된 시간
		
		int [] birthTmpInt = {0, 0, 0};
		int [] nowTmpInt = {0, 0, 0};
		
		for(int i=0; i<birthTmp.length; i++) {
			birthTmpInt[i] = Integer.parseInt(birthTmp[i]);
		}
		
		for(int i=0; i<nowTmp.length; i++) {
			nowTmpInt[i] = Integer.parseInt(nowTmp[i]);
		}
		
		if(nowTmpInt[0]<birthTmpInt[0]) {
			return false;
		} 
		if(nowTmpInt[0] == birthTmpInt[0]) {
			if(nowTmpInt[1] < birthTmpInt[1]) {
				return false;
			}
			if(nowTmpInt[1] == birthTmpInt[1]) {
				if(nowTmpInt[2] < birthTmpInt[2]) {
					return false;
				}				
			}
		}
		
		
		return true;
	}

	@Override
	public MemberVO getMemberDate() {
		return memberDao.selectMember1("test12");
	}

	@Override
	public int getTradeNum(String me_id) {
		if(!checkString(me_id)) {
			return -1;
		}
		return memberDao.selectUserTradeNum(me_id); 

	}
	
	@Override
	public int getReviewNum(String me_id) {
		if(!checkString(me_id)) {
			return -1;
		}
		return memberDao.selectReviewNum(me_id);
	}

	@Override
	public MemberVO getMember(String me_id) {
		if(!checkString(me_id)) {
			return null;
		}
		return memberDao.selectMember(me_id);
	}

	@Override
	public void addPoint(int paymentPrice, String userId) {
		if(checkString(userId) ||
		   checkString(userId)) {
			memberDao.updatePoint(paymentPrice, userId);
		}
		
	}

	//관리자 -> 회원관리에 필요한 코드 
	@Override
	public ArrayList<MemberVO> getMemberList(Criteria_member crim) {
		if(crim == null) {
			//1page 당 10개씩 표기 
			crim = new Criteria_member(1,10);
		}
		return memberDao.selectMemberList(crim);
	}

	@Override
	public int getTotalCountMember(Criteria_member crim) {
		if(crim == null) {
			return 0;
		}
		return memberDao.selectTotalCountMember(crim);
	}
	
}