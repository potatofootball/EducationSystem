package test.dao;

import dao.CourseDao;
import dao.CourseTypeDao;
import db.DBUtil;
import model.Course;
import model.CourseType;

public class CourseDaoTest {

	public static void main(String[] args) {
		CourseTypeDao.loadCourseType();
		CourseDao.loadCourse();
		// 加载专业信息

		int j = 1;
		for (CourseType ct : CourseType.getCourseTypeList()) {
			for (int i = 1; i < 101; i++, j++) {
				CourseDao.addCourse(new Course(ct.getNumber() * 10000 + i, "课程" + j, ct.getNumber()));
			}
		}
		// 添加测试数据

		Course c = new Course(10001, "课程", 1);
		CourseDao.addCourse(c);
		// 测试添加专业

		c.setName("课程1");
		CourseDao.updateCourse(c);
		// 测试修改数据

		CourseDao.delCourse(c);
		// 测试删除专业

		for (Course course : Course.getCourseList()) {
			System.out.println(course.toString());
		}
		// 遍历输出专业对象
		DBUtil.closeConnection();
		// 关闭数据库连接
	}

}
