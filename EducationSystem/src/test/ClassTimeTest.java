package test;

import dao.ClassDao;
import dao.ClassTimeDao;
import dao.CollegeDao;
import dao.CourseDao;
import dao.CourseTypeDao;
import dao.CreditDao;
import dao.NotAllowCourseDao;
import dao.PostDao;
import dao.ProfessionDao;
import dao.SemesterDao;
import dao.ServedDao;
import dao.StudentDao;
import dao.TeacherDao;
import dao.TitleDao;
import db.DBUtil;
import model.ClassTime;

public class ClassTimeTest {

	public static void main(String[] args) {
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

		ClassTime c = ClassTime.getClassTimeTimeList().get(0);
		for (int[] i : c.getTimeList()) {
			for (int j : i) {
				System.out.println(j);
			}
			System.out.println();
		}
		
		DBUtil.closeConnection();
	}

}
