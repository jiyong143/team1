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
import kr.kh.team1.model.vo.ProductVO;

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
		return memberDao.selectReviewNumSeller(me_id) + memberDao.selectReviewNumBuyer(me_id);
	}

	@Override
	public boolean idCheck(String id) {
		MemberVO member = memberDao.selectMember(id);
		return member == null;
	}

	@Override
	public boolean emailCheck(String email) {
		MemberVO member = memberDao.selectMemberEmail(email);
		return member == null; //member를 찾을 수 없다는 뜻 --> 이메일 사용 가능 true
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

	//관리자 -> 회원관리에 필요한 코드 시작
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

	@Override
	public boolean updateAuthority(String me_id, String me_authority, String me_state) {
	    // 유효한 사용자 ID와 권한인지 확인
	    if (me_id == null || me_id.isEmpty() || me_authority == null || me_authority.isEmpty()
	    	|| me_state == null || me_state.isEmpty()) {
	        return false;
	    }
	    
	    // 회원의 권한을 업데이트하고 결과를 받아옵니다.
	    return memberDao.updateAuthority(me_id, me_authority, me_state);
	}
	//관리자 -> 회원관리에 필요한 코드 끝

	@Override
	public boolean updateMember(MemberVO member) {
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
		
		memberDao.updateMember(member);
		
		return true;
	}

	@Override
	public void deleteMember(String me_id) {
		if(checkString(me_id)) {
			memberDao.updateMemberState(me_id);
		}
	}
	
	@Override
	public boolean idCheck(String sns, String email) {
		MemberVO user = memberDao.selectMemberEmail(email);
		return user != null;
	}

	@Override
	public int getMannerScore(String me_id) {
		
		return 0;
	}

//	@Override
//	public boolean signupSns(String sns, String id, String email) {
//		try {
//			int num = Integer.parseInt(id);
//			num = num * 2;
//			id = sns + "!" + num;
//		}catch(Exception e) {
//			id = sns + "!" + id;
//		}
//		MemberVO memberVO = new MemberVO(id, email);
//		return memberDao.insertMember(memberVO);
//	}

//	@Override
//	public MemberVO loginSns(String sns, String id) {
//		try {
//			int num = Integer.parseInt(id);
//			num = num * 2;
//			id = sns + "!" + num;
//		}catch(Exception e) {
//			id = sns + "!" + id;
//		}
//		return memberDao.selectMember(id);
//	}

}