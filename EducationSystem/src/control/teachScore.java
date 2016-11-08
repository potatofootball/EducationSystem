package control;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Teach;
import model.PickCourse;

/**
 * Servlet implementation class teachScore
 */
@WebServlet("/teachscore.do")
public class teachScore extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public teachScore() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String classNumber = request.getParameter("classNumber");
		if (classNumber != null && classNumber != "") {
			Teach teach = Teach.searchTeach(Integer.parseInt(classNumber));
			request.setAttribute("teach", teach);
			request.getRequestDispatcher("/jiaowu/score_management.jsp").forward(request, response);
		} else {
			String semester = request.getParameter("semester");
			String courseType = request.getParameter("courseType");
			String course = request.getParameter("course");
			String teacher = request.getParameter("teacher");
			String classtime = request.getParameter("classtime");
			for (Teach teach : Teach.getTeachList()) {
				if (semester.equals(teach.getSemester().getStartYear() + "-" + teach.getSemester().getOverYear() + "-"
						+ teach.getSemester().getSemester())) {
					if (courseType.equals(teach.getCourse().getCourseType().getName())) {
						if (course.equals(teach.getCourse().getName())) {
							if (teacher.equals(teach.getTeacher().getName())) {
								if (classtime.equals(teach.getClassTime().getName())) {
									request.setAttribute("teach", teach);
									request.getRequestDispatcher("/jiaowu/score_management.jsp").forward(request,
											response);
									return;
								}
							}
						}
					}
				}
			}
			response.sendRedirect("jiaowu/score_management.jsp");
		}
	}

}
