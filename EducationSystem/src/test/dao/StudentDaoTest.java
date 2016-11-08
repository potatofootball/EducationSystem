package test.dao;

import java.util.Date;

import dao.ClassDao;
import dao.CollegeDao;
import dao.ProfessionDao;
import dao.StudentDao;
import db.DBUtil;
import model.Class;
import model.Student;

public class StudentDaoTest {

	public static void main(String[] args) {

		CollegeDao.loadCollege();
		ProfessionDao.loadProfession();
		ClassDao.loadClass();
		StudentDao.loadStudent();
		// 加载测试数据

		int j = 1;
		for (Class c : Class.getClassList()) {
			for (int i = 1; i < 50; i++, j++) {
				StudentDao.addStudent(
						new Student(c.getNumber() * 1000 + i, "学生" + j, "123456", c, "男", new Date().getTime(), true));
			}
		}
		// 添加测试数据
		Student test = new Student(130001, "谢谢", "123456", Class.searchClass(1301011), "男", new Date().getTime(), true);
		StudentDao.addStudent(test);
		// 测试添加学生

		test.setPickCoursePower(false);
		StudentDao.updateStudent(test);
		// 测试修改数据

		for (Student s : Student.getStudentList()) {
			StudentDao.delStudent(s);
		}
		// 测试删除学生

		for (Student s : Student.getStudentList()) {
			System.out.println(s.toString());
		}
		// 遍历输出学生对象
		DBUtil.closeConnection();
		// 关闭数据库连接
	}

}
