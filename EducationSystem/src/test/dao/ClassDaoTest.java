package test.dao;

import dao.ClassDao;
import dao.CollegeDao;
import dao.ProfessionDao;
import db.DBUtil;
import model.Class;
import model.Profession;

public class ClassDaoTest {

	public static void main(String[] args) {
		CollegeDao.loadCollege();
		ProfessionDao.loadProfession();
		ClassDao.loadClass();
		// 导入测试数据
		for (Profession profession : Profession.getProfessionList()) {
			for (int i = 1; i < 4; i++) {
				ClassDao.addClass(new Class(13 * 100000 + profession.getNumber() * 10 + i,
						"13" + profession.getName() + i, profession.getNumber(), 2013));
			}
		}
		// 添加测试数据
		ClassDao.addClass(new Class(1, "一般", 101, 2013));
		// 测试添加班级
		ClassDao.updateClass(new Class(1, "一般", 101, 2016));
		// 测试修改数据
		ClassDao.delClass(new Class(1, "一般", 101, 2016));
		// 测试删除班级
		for (Class aClass : Class.getClassList()) {
			System.out.println(aClass.toString());
		}
		// 遍历输出班级对象
		DBUtil.closeConnection();
		// 关闭数据库连接
	}

}
