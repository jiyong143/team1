package kr.kh.team1.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.kh.team1.dao.MemberDAO;
import kr.kh.team1.model.dto.LoginDTO;
import kr.kh.team1.model.vo.MemberVO;

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
	
}
