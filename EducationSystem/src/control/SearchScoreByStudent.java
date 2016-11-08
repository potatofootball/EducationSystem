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
@WebServlet("/searchscorebystudent.do")
public class SearchScoreByStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchScoreByStudent() {
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
		Student student = (Student) request.getSession().getAttribute("login_user");
		Semester semester = Semester.searchSemester(Integer.parseInt(request.getParameter("option")));
		List<PickCourse> pickCourseList = student.getPickCourseList();
		List<PickCourse> returnPickCourseList = new ArrayList<PickCourse>();
		returnPickCourseList.addAll(pickCourseList);
		for (PickCourse pc : pickCourseList) {
			if (!pc.getTeach().getSemester().equals(semester))
				returnPickCourseList.remove(pc);
		}
		request.getSession().setAttribute("pickCourseList", returnPickCourseList);
		response.sendRedirect("student/timetable.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Student student = (Student) request.getSession().getAttribute("login_user");
		Semester semester = Semester.searchSemester(Integer.parseInt(request.getParameter("option")));
		List<PickCourse> pickCourseList = student.getPickCourseList();
		List<PickCourse> returnPickCourseList = new ArrayList<PickCourse>();
		returnPickCourseList.addAll(pickCourseList);
		if (request.getParameter("button1") != null) {
			for (PickCourse pc : pickCourseList) {
				if (!pc.getTeach().getSemester().equals(semester))
					returnPickCourseList.remove(pc);
			}
		} else if (request.getParameter("button2") != null) {
			List<Semester> semesterList = Semester.getSemesterMap().get(semester.getStartYear());
			for (PickCourse pc : pickCourseList) {
				boolean isRemove = true;
				for (Semester s : semesterList) {
					if (pc.getTeach().getSemester().equals(s))
						isRemove = false;
				}
				if (isRemove)
					returnPickCourseList.remove(pc);
			}
		}
		request.getSession().setAttribute("pickCourseList", returnPickCourseList);
		response.sendRedirect("student/score.jsp");
	}

}
