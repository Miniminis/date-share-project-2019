package filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginCheckFilter
 */
/* @WebFilter("/movie/*") */
//    /movie/* 뒤쪽으로 처리되는 모든 페이지에 대해서 이 Filter 통해서 로그인 체크 처리를 해준다. 
public class LoginCheckFilter implements Filter {

    public LoginCheckFilter() {
    }

	
	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		
		//조건을 주고 처리하는 부분
		
		HttpServletRequest req = (HttpServletRequest)request;
		HttpSession session = req.getSession(false); //기존에 있던 session 을 가져옴 
		HttpServletResponse resp = (HttpServletResponse)response;
	
		boolean loginChk = false;

		if(session != null && session.getAttribute("userInfo") != null) {
			loginChk = true;
		}
		
		if(loginChk) {
			// pass the request along the filter chain
			chain.doFilter(request, response);
			
		}else {
			//RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
			//dispatcher.forward(request, response);
			resp.sendRedirect(req.getContextPath()+"/index.jsp");
		}
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
