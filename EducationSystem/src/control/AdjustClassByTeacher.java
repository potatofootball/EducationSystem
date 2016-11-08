package control;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdjustClassDao;
import model.AdjustClass;
import model.Teach;

/**
 * Servlet implementation class AdjustClass
 */
@WebServlet("/createadjustclass.do")
public class AdjustClassByTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AdjustClassByTeacher() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("id");
		String start1 = request.getParameter("start1");
		String over1 = request.getParameter("over1");
		String week1 = request.getParameter("week1");
		String week2 = request.getParameter("week2");
		String start2 = request.getParameter("start2");
		String over2 = request.getParameter("over2");
		String msg = request.getParameter("msg");
		Teach teach = Teach.searchTeach(Integer.parseInt(id));
		AdjustClass ac = new AdjustClass(AdjustClass.getAdjustClassList().size() + 1, Integer.parseInt(id),
				teach.getClassTime().getTime(),
				start1 + "," + over1 + "," + week1 + "," + week2 + "," + start2 + "," + over2, msg,
				new Date().getTime(), 0L, 1, 1);
		AdjustClassDao.addAdjustClass(ac);
		response.sendRedirect("teacher/changeclass.jsp");
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
