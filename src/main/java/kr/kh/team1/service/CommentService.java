package kr.kh.team1.service;

import java.util.ArrayList;

import kr.kh.team1.model.vo.CommentVO;
import kr.kh.team1.model.vo.MemberVO;
import kr.kh.team1.pagination.Criteria_supot;

public interface CommentService {

	ArrayList<CommentVO> getCommentList(Criteria_supot cris);

	int getTotalCount(Criteria_supot cris);

	boolean insertComment(CommentVO comment, MemberVO user);

}
