package test.dao;

import dao.CollegeDao;
import db.DBUtil;
import model.College;

public class CollegeDaoTest {

	public static void main(String[] args) {
		CollegeDao.loadCollege();
		for (int i = 1; i <= 10; i++) {
			CollegeDao.addCollege(new College(i, "管理学院" + i));
		}
		// 添加测试数据
		College college = new College(1, "管理学院");
		// 添加学院测试
		CollegeDao.addCollege(college);
		// 修改学院信息测试
		college.setName("管理学院2");
		CollegeDao.updateCollege(college);
		// 删除学院测试
		CollegeDao.delCollege(college);
		// 学院信息装载测试
		for (College college2 : College.getCollegeList()) {
			System.out.println(college2.toString());
		}
		DBUtil.closeConnection();
		// 关闭数据库连接
	}

}
