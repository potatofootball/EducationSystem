package test;

import dao.CollegeDao;
import model.College;

public class CollegeDaoTest {

	public static void main(String[] args) {
		College college = new College(2, "管理学院");
		// 添加学院测试
		CollegeDao.addCollege(college);
		// 修改学院信息测试
		college.setName("管理学院");
		CollegeDao.updateCollege(college);
		// 删除学院测试
		CollegeDao.delCollege(college.getNumber());
		//学院信息装载测试
		CollegeDao.loadCollege();
	}

}
