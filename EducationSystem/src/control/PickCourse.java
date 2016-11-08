package control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.PickCourseAction;
import model.Course;
import model.CourseType;
import model.Semester;
import model.Student;
import model.Teach;

/**
 * Servlet implementation class PickCourse
 */
@WebServlet("/pickcourse")
public class PickCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PickCourse() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Student student = (Student) request.getSession().getAttribute("login_user");
		int number = Integer.parseInt(request.getParameter("coursetype"));
		List<Teach> teachList = new ArrayList<Teach>();
		List<Teach> returnTeachList = new ArrayList<Teach>();
		for (Course course : CourseType.searchCourseType(number).getCourseList()) {
			teachList.addAll(course.getTeachList());
		}
		// 向列表中添加所有该课程类型的课程
		for (model.PickCourse pickCourse : student.getPickCourseList()) {
			teachList.remove(pickCourse.getTeach());
		}
		// 删除已经选过的课程
		returnTeachList.addAll(teachList);
		// 把队列中的数据添加到返回的队列
		Semester semester = Semester.getThisSemester();
		for (Teach teach : teachList) {
			if (!teach.getSemester().equals(semester)) {
				returnTeachList.remove(teach);
			}
		}
		request.setAttribute("teachList", returnTeachList);
		request.getRequestDispatcher("student/course.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		Student student = (Student) request.getSession().getAttribute("login_user");
		String[] array = request.getParameterValues("checkbox");
		if (array != null || array.length > 0) {
			for (String s : array) {
				PickCourseAction.addPickCourse(new model.PickCourse(PickCourseAction.getMaxNumber() + 1,
						Integer.parseInt(s), student.getNumber(), 0));
			}
		}
		doGet(request, response);
	}

}
