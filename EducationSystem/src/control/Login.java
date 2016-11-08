package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.StudentAction;
import action.TeacherAction;
import model.Student;
import model.Teacher;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login.do")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int username = 0;
		try {
			username = Integer.parseInt(request.getParameter("username"));
		} catch (NumberFormatException ex) {
			request.getSession().setAttribute("errormessage", "账户为数字学号或职工号");
			response.sendRedirect("index.jsp");
			return;
		}
		String password = request.getParameter("password");
		String identity = request.getParameter("identity");

		if ("student".equals(identity)) {
			Student s = StudentAction.login(username, password);
			if (s != null) {
				request.getSession().setAttribute("login_user", s);
				response.sendRedirect("student/index.jsp");
				return;
			}
		} else if ("teacher".equals(identity)) {
			Teacher t = TeacherAction.login(username, password, 1);
			if (t != null) {
				request.getSession().setAttribute("login_user", t);
				response.sendRedirect("teacher/index.jsp");
				return;
			}
		} else if ("jiaowu".equals(identity)) {
			Teacher t = TeacherAction.login(username, password, 0);
			if (t != null) {
				request.getSession().setAttribute("login_user", t);
				response.sendRedirect("jiaowu/index.jsp");
				return;
			}
		}
		request.getSession().setAttribute("errormessage", "账户或密码错误");
		response.sendRedirect("index.jsp");

	}

}
