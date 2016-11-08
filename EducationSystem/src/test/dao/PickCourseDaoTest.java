package test.dao;

import dao.BuildingDao;
import dao.ClassAreaDao;
import dao.ClassDao;
import dao.ClassTimeDao;
import dao.ClassroomDao;
import dao.CollegeDao;
import dao.CourseDao;
import dao.CourseTypeDao;
import dao.PickCourseDao;
import dao.ProfessionDao;
import dao.StudentDao;
import dao.TeachDao;
import dao.TeacherDao;
import dao.TitleDao;
import db.DBUtil;
import model.PickCourse;
import model.Student;
import model.Teach;

public class PickCourseDaoTest {

	public static void main(String[] args) {
		CollegeDao.loadCollege();
		ProfessionDao.loadProfession();
		ClassDao.loadClass();
		StudentDao.loadStudent();
		CourseTypeDao.loadCourseType();
		CourseDao.loadCourse();
		TitleDao.loadTitle();
		TeacherDao.loadTeacher();
		ClassTimeDao.loadClassTime();
		ClassAreaDao.loadClassArea();
		BuildingDao.loadBuilding();
		ClassroomDao.loadClassroom();
		TeachDao.loadTeach();
		PickCourseDao.loadPickCourse();
		// 加载选课信息

		int j = 7350;
		for (Teach t : Teach.getTeachList()) {
			PickCourseDao
					.addPickCourse(new PickCourse(j, t.getNumber(), Student.getStudentList().get(0).getNumber(), 0));
			j++;
		}

		int i = 1;
		do {
			for (Teach t : Teach.getTeachList()) {
				PickCourseDao.addPickCourse(
						new PickCourse(i, t.getNumber(), Student.getStudentList().get(i).getNumber(), 0));
				i++;
				if (i > Student.getStudentList().size())
					break;
			}
		} while (i < Student.getStudentList().size() + 1);
		// 添加测试数据

		PickCourse pc = new PickCourse(2, 1, 1301011001, 100);
		PickCourseDao.addPickCourse(pc);
		// 测试添加选课

		pc.setScore(99.5f);
		PickCourseDao.updatePickCourse(pc);
		// 测试修改数据

		pc.setNumber(1);
		PickCourseDao.delPickCourse(pc);
		// 测试删除选课

		for (PickCourse pickCourse : PickCourse.getPickCourseList()) {
			System.out.println(pickCourse.toString());
		}
		// 遍历输出选课对象
		DBUtil.closeConnection();
		// 关闭数据库连接
	}

}
