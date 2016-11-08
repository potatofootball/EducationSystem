package test;

import dao.CollegeDao;
import dao.ProfessionDao;
import model.College;
import model.Profession;

public class ProfessionDaoTest {

	public static void main(String[] args) {
		CollegeDao.loadCollege();
		ProfessionDao.loadProfession();
		// 加载学院信息
		for (College college : College.getCollegeList()) {
			for (int j = 1; j <= 5; j++) {
				ProfessionDao.addProfession(new Profession(college.getNumber() * 100 + j,
						"信息管理" + (college.getNumber() * 100 + j), college.getNumber()));
			}
		}
		// 添加测试数据
		ProfessionDao.addProfession(new Profession(1, "test1", 1));
		// 测试添加专业
		ProfessionDao.updateProfession(new Profession(1, "test1", 1));
		// 测试修改数据
		ProfessionDao.delProfession(new Profession(1, "test1", 1));
		// 测试删除专业
		for (Profession p : Profession.getProfessionList()) {
			System.out.println(p.toString());
		}
		// 遍历输出专业对象
	}

}
