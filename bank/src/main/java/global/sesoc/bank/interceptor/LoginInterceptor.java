package global.sesoc.bank.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String loginId = (String) request.getSession().getAttribute("loginId");
		if (loginId == null) {
			response.sendRedirect(request.getContextPath() + "/login");
			
			return false;
		}
		
		return super.preHandle(request, response, handler);
	}

}
