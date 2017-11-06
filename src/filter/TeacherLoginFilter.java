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

@WebFilter(filterName = "TeacherLoginFilter", 
urlPatterns = {"/teacher/addUserFlag.jsp", "/teacher/arrangeExam.jsp", "/teacher/main.jsp", "/teacher/scoreQuery.html"}) 
public class TeacherLoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain)
			throws IOException, ServletException {
		
		HttpServletRequest request = (HttpServletRequest)arg0;
		HttpServletResponse response = (HttpServletResponse)arg1;
		HttpSession session = request.getSession();
		
		if (session.getAttribute("teacherId") != null)
			chain.doFilter(arg0, arg1);
		else
			response.sendRedirect(request.getContextPath() + "/teacher/login.jsp");
		
	}

}