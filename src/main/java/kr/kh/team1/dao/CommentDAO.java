package kr.kh.team1.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team1.model.vo.CommentVO;
import kr.kh.team1.pagination.Criteria_supot;

public interface CommentDAO {

	ArrayList<CommentVO> selectCommentList(@Param("cris") Criteria_supot cris);

	int selectTotalCount(@Param("cris") Criteria_supot cris);

	boolean insertComment(@Param("comment") CommentVO comment);

	CommentVO selectComment(@Param("co_num") int co_num);

	boolean commentDelete(@Param("co_num") int co_num);

	boolean updateComment(@Param("comment") CommentVO comment);

}
