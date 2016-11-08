package control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.PickCourse;
import model.Semester;
import model.Student;

/**
 * Servlet implementation class SearchScoreByStudent
 */
@WebServlet("/SearchScoreByTeacher.do")
public class SearchScoreByTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchScoreByTeacher() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Student student = Student.searchStudent(Integer.parseInt(request.getParameter("studentId")));
		List<PickCourse> pickCourseList = student.getPickCourseList();
		request.getSession().setAttribute("pickCourseList", pickCourseList);
		request.getSession().setAttribute("student", student);
		response.sendRedirect("jiaowu/student_score.jsp");
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
