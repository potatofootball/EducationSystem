package control;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.PickCourseAction;
import action.TeachAction;
import model.PickCourse;

/**
 * Servlet implementation class CancelPickCourse
 */
@WebServlet("/cancelpickcourse.do")
public class CancelPickCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CancelPickCourse() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		int number = Integer.parseInt(request.getParameter("number"));
		TeachAction.reduceChoose(PickCourse.searchPickCourse(number).getTeach());
		PickCourseAction.calcelPickCourse(number);
		response.sendRedirect("student/pickcourse.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
