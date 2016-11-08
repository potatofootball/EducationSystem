package test.dao;

import java.util.Date;

import dao.AdjustClassDao;
import dao.BuildingDao;
import dao.ClassAreaDao;
import dao.ClassTimeDao;
import dao.ClassroomDao;
import dao.CollegeDao;
import dao.CourseDao;
import dao.CourseTypeDao;
import dao.PostDao;
import dao.ProfessionDao;
import dao.ServedDao;
import dao.TeachDao;
import dao.TeacherDao;
import dao.TitleDao;
import db.DBUtil;
import model.AdjustClass;
import model.Teach;

public class AdjustClassDaoTest {
	public static String forMatchTime(String time) {
		time = time.substring(12);
		return time;
	}

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
		TeachDao.loadTeach();
		AdjustClassDao.loadAdjustClass();
		// 加载调课信息

		for (int i = 1; i < 11; i++) {
			AdjustClassDao.addAdjustClass(new AdjustClass(i, Teach.getTeachList().get(i).getNumber(),
					forMatchTime(Teach.getTeachList().get(i).getClassTime().getTime()), "1,18,0,2,12,13", "调课" + i,
					new Date().getTime(), new Date(0).getTime(), 0, 0));
		}
		// 添加测试数据

		AdjustClass ac = new AdjustClass(1, 1, "1,2,0,1", "3,4,0", "调课", new Date().getTime(), new Date(0).getTime(), 0,
				0);
		AdjustClassDao.addAdjustClass(ac);
		// 测试添加调课

		ac.setMessage("12");
		AdjustClassDao.updateAdjustClass(ac);
		// 测试修改数据

		AdjustClassDao.delAdjustClass(ac);
		// 测试删除调课

		for (AdjustClass adjustClass : AdjustClass.getAdjustClassList()) {
			System.out.println(adjustClass.toString());
		}
		// 遍历输出调课对象
		DBUtil.closeConnection();
		// 关闭数据库连接
	}

}
