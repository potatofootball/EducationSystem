package test.dao;

import java.util.Date;

import dao.CollegeDao;
import dao.ProfessionDao;
import dao.TeacherDao;
import dao.TitleDao;
import db.DBUtil;
import model.College;
import model.Profession;
import model.Teacher;

public class TeacherDaoTest {

	public static void main(String[] args) {
		CollegeDao.loadCollege();
		ProfessionDao.loadProfession();
		TitleDao.loadTitle();
		TeacherDao.loadTeacher();
		// 加载专业信息

		int j = 1;
		for (College college : College.getCollegeList()) {
			int k = 1;
			for (Profession profession : college.getProfessionList()) {
				for (int i = 1; i < 11; i++, j++, k++) {
					TeacherDao.addTeacher(new Teacher(college.getNumber() * 1000 + k, "老师" + j, "123456", "男",
							new Date().getTime(), college.getNumber(), profession.getNumber(), i, 1));
				}
			}
		}
		// 添加测试数据

		Teacher t = new Teacher(1001, "老师", "123456", "男", new Date().getTime(), 1, 101, 1, 1);
		TeacherDao.addTeacher(t);
		// 测试添加专业

		t.setName("老史");
		TeacherDao.updateTeacher(t);
		// 测试修改数据

		TeacherDao.delTeacher(t);
		// 测试删除专业

		for (Teacher teacher : Teacher.getTeacherList()) {
			System.out.println(teacher.toString());
		}
		// 遍历输出专业对象
		DBUtil.closeConnection();
		// 关闭数据库连接

	}

}
