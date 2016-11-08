package test.dao;

import dao.ClassAreaDao;
import db.DBUtil;
import model.ClassArea;

public class ClassAreaDaoTest {

	public static void main(String[] args) {

		ClassAreaDao.loadClassArea();
		// 加载教学区信息

		for (int i = 1; i < 4; i++) {
			ClassAreaDao.addClassArea(new ClassArea(i, "教学区" + i));
		}
		// 添加测试数据

		ClassArea ca = new ClassArea(1, "本部");
		ClassAreaDao.addClassArea(ca);
		// 测试添加教学区

		ca.setName("分校");
		ClassAreaDao.updateClassArea(ca);
		// 测试修改数据

		ClassAreaDao.delClassArea(ca);
		// 测试删除教学区

		for (ClassArea classArea : ClassArea.getClassAreaList()) {
			System.out.println(classArea.toString());
		}
		// 遍历输出教学区对象
		DBUtil.closeConnection();
		// 关闭数据库连接
	}

}
