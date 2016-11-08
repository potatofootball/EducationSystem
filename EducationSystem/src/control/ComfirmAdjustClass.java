package control;

import java.io.IOException;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.AdjustClassDao;
import model.AdjustClass;

/**
 * Servlet implementation class AdjustClass
 */
@WebServlet("/adjustclass.do")
public class ComfirmAdjustClass extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ComfirmAdjustClass() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Enumeration<String> enumeration = request.getParameterNames();
		while (enumeration.hasMoreElements()) {
			int id = Integer.parseInt(enumeration.nextElement());
			String b = request.getParameter(id + "");
			AdjustClass ac = AdjustClass.searchAdjustClass(id);
			ac.setConfirm(true);
			ac.setConfirmTime(new Date().getTime());
			if (b.equals("true")) {
				ac.setAllow(true);
			} else {
				ac.setAllow(false);
			}
			AdjustClassDao.updateAdjustClass(ac);
		}
		response.sendRedirect("jiaowu/adjustclass.jsp");
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
