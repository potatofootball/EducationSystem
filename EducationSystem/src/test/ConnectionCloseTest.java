package test;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

//import java.sql.Connection;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.sql.Statement;
//import java.sql.PreparedStatement;

import dao.AdjustClassDao;
import dao.BuildingDao;
import dao.ClassAreaDao;
import dao.ClassDao;
import dao.ClassTimeDao;
import dao.ClassroomDao;
import dao.CollegeDao;
import dao.CourseDao;
import dao.CourseTypeDao;
import dao.CreditDao;
import dao.NotAllowCourseDao;
import dao.PickCourseDao;
import dao.PostDao;
import dao.ProfessionDao;
import dao.SemesterDao;
import dao.ServedDao;
import dao.StudentDao;
import dao.TeachDao;
import dao.TeacherDao;
import dao.TitleDao;
import db.DBUtil;
import model.PickCourse;
//import model.ClassTime;
//import model.Teach;
import model.Teach;

public class ConnectionCloseTest {

	public static void main(String[] args) {
		CollegeDao.loadCollege();
		ProfessionDao.loadProfession();
		ClassDao.loadClass();
		StudentDao.loadStudent();
		CourseTypeDao.loadCourseType();
		CreditDao.loadCredit();
		CourseDao.loadCourse();
		NotAllowCourseDao.loadNotAllowCourse();
		TitleDao.loadTitle();
		TeacherDao.loadTeacher();
		PostDao.loadPost();
		ServedDao.loadServed();
		SemesterDao.loadSemester();
		ClassTimeDao.loadClassTime();
		ClassAreaDao.loadClassArea();
		BuildingDao.loadBuilding();
		ClassroomDao.loadClassroom();
		TeachDao.loadTeach();
		AdjustClassDao.loadAdjustClass();
		PickCourseDao.loadPickCourse();

//		Connection conn = DBUtil.getConnection();
//		try {
//			for (Teach teach : Teach.getTeachList()) {
//				String sql = "update teach set choose = ? where number= ?";
//				PreparedStatement ptmt = conn.prepareStatement(sql);
//				ptmt.setInt(1, teach.getPickCourseList().size());
//				ptmt.setInt(2, teach.getNumber());
//				ptmt.execute();
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			DBUtil.closeConnection();
//		}
		
		DBUtil.closeConnection();
	}
}
