package listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import dao.AdjustClassDao;
import dao.BuildingDao;
import dao.ClassAreaDao;
import dao.ClassDao;
import dao.ClassTimeDao;
import dao.ClassroomDao;
import dao.CollegeDao;
import dao.CourseDao;
import dao.CourseTypeDao;
import dao.CreditDao;
import dao.NotAllowCourseDao;
import dao.PickCourseDao;
import dao.PostDao;
import dao.ProfessionDao;
import dao.SemesterDao;
import dao.ServedDao;
import dao.StudentDao;
import dao.TeachDao;
import dao.TeacherDao;
import dao.TitleDao;
import db.DBUtil;

/**
 * Application Lifecycle Listener implementation class ServletContestLister
 *
 */
@WebListener
public class ServletContestLister implements ServletContextListener {

	/**
	 * @see ServletContextListener#contextInitialized(ServletContextEvent)
	 */
	public void contextInitialized(ServletContextEvent sce) {
		CollegeDao.loadCollege();
		ProfessionDao.loadProfession();
		ClassDao.loadClass();
		StudentDao.loadStudent();
		CourseTypeDao.loadCourseType();
		CreditDao.loadCredit();
		CourseDao.loadCourse();
		NotAllowCourseDao.loadNotAllowCourse();
		TitleDao.loadTitle();
		TeacherDao.loadTeacher();
		PostDao.loadPost();
		ServedDao.loadServed();
		SemesterDao.loadSemester();
		ClassTimeDao.loadClassTime();
		ClassAreaDao.loadClassArea();
		BuildingDao.loadBuilding();
		ClassroomDao.loadClassroom();
		TeachDao.loadTeach();
		AdjustClassDao.loadAdjustClass();
		PickCourseDao.loadPickCourse();
		System.out.println("数据库数据加载完成");
	}

	/**
	 * @see ServletContextListener#contextDestroyed(ServletContextEvent)
	 */
	public void contextDestroyed(ServletContextEvent sce) {
		DBUtil.closeConnection();
		System.out.println("close connection");
	}

}
