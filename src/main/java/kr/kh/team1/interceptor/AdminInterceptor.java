package kr.kh.team1.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import kr.kh.team1.model.vo.MemberVO;

public class AdminInterceptor extends HandlerInterceptorAdapter {

	/* preHandle에서 return값이 true이면 가려던 컨트롤러로 가서 작업을 진행
	 * return값이 false이면 가려던 컨트롤러로 가지 마세요. 리다이렉트할 경로가 있으면 해당 경로로 이동
	 * */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
	    throws Exception {
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		if(user==null) {
			response.sendRedirect(request.getContextPath() + "/");
			return false;
		}
		//유저권한이 유저이면 관리자 페이지 못들어감
		if(user.getMe_authority().equals("user")){
			response.sendRedirect(request.getContextPath() + "/");
			return false;
		}
		
		return true;
	}

}
