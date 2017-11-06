package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(filterName = "StuLoginFilter", 
urlPatterns = {"/student/test.jsp", "/student/welcome.jsp", "/student/finish.jsp", "/student/fail.html"}) 
public class StuLoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest)arg0;
		HttpServletResponse response = (HttpServletResponse)arg1;
		HttpSession session = request.getSession();
		
		if (session.getAttribute("userId") != null)
			chain.doFilter(arg0, arg1);
		else
			response.sendRedirect(request.getContextPath() + "/student/login.jsp");
		
	}

}