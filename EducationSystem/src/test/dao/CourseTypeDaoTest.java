package test.dao;

import dao.CourseTypeDao;
import db.DBUtil;
import model.CourseType;

public class CourseTypeDaoTest {

	public static void main(String[] args) {

		CourseTypeDao.loadCourseType();
		// 加载测试数据

		for (int i = 1; i < 6; i++) {
			CourseTypeDao.addCourseType(new CourseType(i, "课程类型" + i, 0));
		}
		// 添加测试数据

		CourseType ct = new CourseType(1, "课程类型", 0);
		CourseTypeDao.addCourseType(ct);
		// 测试添加课程类型

		ct.setName("课程类型1");
		CourseTypeDao.updateCourseType(ct);
		// 测试修改数据

		CourseTypeDao.delCourseType(ct);
		// 测试删除课程类型

		for (CourseType c : CourseType.getCourseTypeList()) {
			System.out.println(c.toString());
		}
		// 遍历输出课程类型对象
		DBUtil.closeConnection();
		// 关闭数据库连接
	}

}
