package test.dao;

import dao.ClassTimeDao;
import db.DBUtil;
import model.ClassTime;

public class ClassTimeDaoTest {

	public static void main(String[] args) {

		ClassTimeDao.loadClassTime();
		// 加载上课时间信息

		int j = 1;
		for (int k = 1; k < 6; k++) {
			for (int i = 1; i < 9; i += 2, j++) {
				ClassTimeDao.addClassTime(new ClassTime(j, ("2016-2017第1个学期第1-18周第" + k + "周第" + i + "-" + (i + 1)),
						"2016,2017,1,01,18,0," + k + "," + i + "," + (i + 1)));
			}
		}
		// 添加测试数据

		ClassTime ct = new ClassTime(0, "1", "1,2,3,4,56,123");
		ClassTimeDao.addClassTime(ct);
		// 测试添加上课时间

		ct.setName("2");
		ClassTimeDao.updateClassTime(ct);
		// 测试修改数据

		ClassTimeDao.delClassTime(ct);
		// 测试删除上课时间

		for (ClassTime classTime : ClassTime.getClassTimeTimeList()) {
			System.out.println(classTime.toString());
		}
		// 遍历输出上课时间对象
		DBUtil.closeConnection();
		// 关闭数据库连接
	}

}
