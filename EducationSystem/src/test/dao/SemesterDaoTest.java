package test.dao;

import dao.SemesterDao;
import db.DBUtil;
import model.Semester;

public class SemesterDaoTest {

	public static void main(String[] args) {

		SemesterDao.loadSemester();
		// 加载专业信息

		int k = 1;
		for (int i = 2001; i < 2017; i++) {
			for (int j = 1; j < 4; j++, k++) {
				SemesterDao.addSemester(new Semester(k, i, i + 1, j, false));
			}
		}
		// 添加测试数据

		Semester s = new Semester(1, 2001, 2002, 1, false);
		SemesterDao.addSemester(s);
		// 测试添加专业

		s.setSemester(2);
		SemesterDao.updateSemester(s);
		// 测试修改数据

		SemesterDao.delSemester(s);
		// 测试删除专业

		for (Semester semester : Semester.getSemesterList()) {
			System.out.println(semester.toString());
		}
		// 遍历输出专业对象
		DBUtil.closeConnection();
		// 关闭数据库连接
	}

}
