package filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebFilter(filterName = "AdminLoginFilter", urlPatterns = {"/admin/*"},
initParams = {@WebInitParam(name = "notFilter", value = "/admin/login.jsp;/admin/main.jsp")})
public class AdminLoginFilter implements Filter {
	private FilterConfig config;

	//在用户未登录前过滤禁止访问的页面
	@Override
	public void doFilter(ServletRequest arg0, ServletResponse arg1, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest)arg0;
		HttpServletResponse response = (HttpServletResponse)arg1;
		HttpSession session = request.getSession();
		
		String pathStr = config.getInitParameter("notFilter");
		if (pathStr != null) {
			String[] paths = pathStr.split(";");
			for (String path : paths) {
				if (request.getRequestURI().indexOf(path) != -1) {
					chain.doFilter(arg0, arg1);
					return;
				}
			}
		}
		
		if (session.getAttribute("adminId") != null)
			chain.doFilter(arg0, arg1);
		else
			response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
	}
	
	@Override
	public void init(FilterConfig config) {
		this.config = config;
	}

}
