package test.dao;

import dao.CollegeDao;
import dao.CourseDao;
import dao.CourseTypeDao;
import dao.NotAllowCourseDao;
import dao.ProfessionDao;
import db.DBUtil;
import model.Course;
import model.NotAllowCourse;
import model.Profession;

public class NotAllowCourseDaoTest {

	public static void main(String[] args) {
		CollegeDao.loadCollege();
		ProfessionDao.loadProfession();
		CourseTypeDao.loadCourseType();
		CourseDao.loadCourse();
		NotAllowCourseDao.loadNotAllowCourse();
		// 加载专业信息

		int i = 1;
		for (Course course : Course.getCourseList()) {
			NotAllowCourseDao.addNotAllowCourse(new NotAllowCourse(i, 101, course.getNumber()));
			i++;
		}
		// 添加测试数据

		 NotAllowCourse nac = new NotAllowCourse(1, 101, 10001);
		 NotAllowCourseDao.addNotAllowCourse(nac);
		// 测试添加专业

		 nac.setProfession(Profession.searchProfession(102));
		 NotAllowCourseDao.updateNotAllowCourse(nac);
		// 测试修改数据

		 NotAllowCourseDao.delNotAllowCourse(nac);
		// 测试删除专业

		for (NotAllowCourse n : NotAllowCourse.getNotAllowCourseList()) {
			System.out.println(n.toString());
		}
		// 遍历输出专业对象
		DBUtil.closeConnection();
		// 关闭数据库连接
	}

}
