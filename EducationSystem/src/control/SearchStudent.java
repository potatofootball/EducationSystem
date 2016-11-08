package control;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Class;
import model.Student;

/**
 * Servlet implementation class SearchStudent
 */
@WebServlet("/searchstudent.do")
public class SearchStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String studentId = request.getParameter("number");
		List<Student> list = new ArrayList<Student>();
		int id = 0;
		if (studentId != null && studentId.length() > 0) {
			try {
				id = Integer.parseInt(studentId);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		if (id != 0) {
			Student student = Student.searchStudent(id);
			if (student != null) {
				list.add(student);
			}
		} else {
			int classId = Integer.parseInt(request.getParameter("class"));
			for (Class theClass : Class.getClassList()) {
				if (theClass.getNumber() == classId) {
					list.addAll(theClass.getStudentList());
				}
			}
		}
		request.getSession().setAttribute("studentList", list);
		response.sendRedirect("jiaowu/student_imformation.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String studentId = request.getParameter("number");
		List<Student> list = new ArrayList<Student>();
		int id = 0;
		if (studentId != null && studentId.length() > 0) {
			try {
				id = Integer.parseInt(studentId);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			}
		}
		if (id != 0) {
			Student student = Student.searchStudent(id);
			if (student != null) {
				list.add(student);
			}
		} else {
			int classId = Integer.parseInt(request.getParameter("class"));
			for (Class theClass : Class.getClassList()) {
				if (theClass.getNumber() == classId) {
					list.addAll(theClass.getStudentList());
				}
			}
		}
		request.getSession().setAttribute("studentList", list);
		response.sendRedirect("teacher/class_imformation.jsp");
	}

}
