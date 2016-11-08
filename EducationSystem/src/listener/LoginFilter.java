package listener;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter(filterName = "/LoginFilter", urlPatterns = { "/*" })
public class LoginFilter implements Filter {
	private final String LOGIN_PAGE = "/EducationSystem/index.jsp";
	private final String[] UN_CONFIRM_URL = { "/EducationSystem/index.jsp", "/login.do", "/css/", "/images/", "/js/" };

	/**
	 * Default constructor.
	 */
	public LoginFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();
		if (session.getAttribute("login_user") != null) {
			chain.doFilter(request, response);
			return;
		}
		String requestURL = req.getRequestURL().toString();
		for (int i = 0; i < UN_CONFIRM_URL.length; i++) {
			if (requestURL.indexOf(UN_CONFIRM_URL[i]) > -1) {
				chain.doFilter(request, response);
				return;
			}
		}
		HttpServletResponse res = (HttpServletResponse) response;
		res.sendRedirect(LOGIN_PAGE);
		return;
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
	}

}
