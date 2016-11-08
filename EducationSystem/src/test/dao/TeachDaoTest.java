package test.dao;

import dao.BuildingDao;
import dao.ClassAreaDao;
import dao.ClassTimeDao;
import dao.ClassroomDao;
import dao.CollegeDao;
import dao.CourseDao;
import dao.CourseTypeDao;
import dao.PostDao;
import dao.ProfessionDao;
import dao.SemesterDao;
import dao.ServedDao;
import dao.TeachDao;
import dao.TeacherDao;
import dao.TitleDao;
import db.DBUtil;
import model.Classroom;
import model.Course;
import model.Teach;
import model.Teacher;

public class TeachDaoTest {

	public static void main(String[] args) {
		CollegeDao.loadCollege();
		ProfessionDao.loadProfession();
		CourseTypeDao.loadCourseType();
		CourseDao.loadCourse();
		TitleDao.loadTitle();
		TeacherDao.loadTeacher();
		PostDao.loadPost();
		ServedDao.loadServed();
		ClassTimeDao.loadClassTime();
		ClassAreaDao.loadClassArea();
		BuildingDao.loadBuilding();
		ClassroomDao.loadClassroom();
		SemesterDao.loadSemester();
		TeachDao.loadTeach();
		// 加载授课信息

		for (int i = 0; i < 225; i++) {
			TeachDao.addTeach(new Teach(i + 1, Teacher.getTeacherList().get(i).getNumber(),
					Course.getCourseList().get(i).getNumber(), Classroom.getClassroomList().get(i).getNumber(), 2, 100,
					0, 1, 1, 1));
		}
		for (int i = 225; i < 450; i++) {
			TeachDao.addTeach(new Teach(i + 1, Teacher.getTeacherList().get(i).getNumber(),
					Course.getCourseList().get(i).getNumber(), Classroom.getClassroomList().get(i - 225).getNumber(), 2,
					100, 0, 2, 1, 1));
		}
		for (int i = 450; i < 500; i++) {
			TeachDao.addTeach(new Teach(i + 1, Teacher.getTeacherList().get(i).getNumber(),
					Course.getCourseList().get(i).getNumber(), Classroom.getClassroomList().get(i - 450).getNumber(), 2,
					100, 0, 3, 1, 1));
		}
		// 添加测试数据

		Teach t = new Teach(0, 1001, 10001, 1010101, 3, 100, 0, 1, 1, 1);
		TeachDao.addTeach(t);
		// 测试添加授课

		t.setCapacity(200);
		TeachDao.updateTeach(t);
		// 测试修改数据

		TeachDao.delTeach(t);
		// 测试删除授课

		for (Teach teach : Teach.getTeachList()) {
			System.out.println(teach.toString());
		}
		// 遍历输出授课对象
		DBUtil.closeConnection();
		// 关闭数据库连接
	}

}
