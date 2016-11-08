package test.dao;

import dao.ClassDao;
import dao.CollegeDao;
import dao.CourseTypeDao;
import dao.CreditDao;
import dao.ProfessionDao;
import dao.StudentDao;
import db.DBUtil;
import model.CourseType;
import model.Credit;
import model.Profession;

public class CreditDaoTest {

	public static void main(String[] args) {
		CollegeDao.loadCollege();
		ProfessionDao.loadProfession();
		ClassDao.loadClass();
		StudentDao.loadStudent();
		CourseTypeDao.loadCourseType();
		CreditDao.loadCredit();
		// 加载测试数据

		int i = 1;
		for (Profession p : Profession.getProfessionList()) {
			for (CourseType ct : CourseType.getCourseTypeList()) {
				CreditDao.addCredit(new Credit(i, p.getNumber(), ct.getNumber(), 25));
				i++;
			}
		}
		// 添加测试数据

		Credit c = new Credit(1, 101, 1, 30);
		CreditDao.addCredit(c);
		// 测试添加学分要求

		c.setCredit(35);
		CreditDao.updateCredit(c);
		// 测试修改数据

		CreditDao.delCredit(c);
		// 测试删除学分要求

		for (Credit credit : Credit.getCreditList()) {
			System.out.println(credit.toString());
		}
		// 遍历输出学分要求对象
		DBUtil.closeConnection();
		// 关闭数据库连接
	}

}
