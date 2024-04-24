package kr.kh.team1.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.kh.team1.dao.CommentDAO;
import kr.kh.team1.model.vo.CommentVO;
import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.pagination.Criteria_supot;

@Service
public class CommentServiceImp implements CommentService{
	
	@Autowired
	CommentDAO commentDao;

	@Override
	public ArrayList<CommentVO> getCommentList(Criteria_supot cris) {
		if(cris == null) {
			return null;
		}
		return commentDao.selectCommentList(cris);
	}

	@Override
	public int getTotalCount(Criteria_supot cris) {
		if(cris == null) {
			return 0;
		}
		return commentDao.selectTotalCount(cris);
	}

	@Override
	public boolean insertComment(CommentVO comment, MemberVO user) {
		if(user == null || user.getMe_id() == null)
			return false;
		if(	comment == null ||
			!checkString(comment.getCo_content()))
			return false;
		comment.setCo_me_id(user.getMe_id());
		System.out.println(comment);
		return commentDao.insertComment(comment);
	}

	private boolean checkString(String str) {
		return str != null && str.length() != 0;
	}

}
