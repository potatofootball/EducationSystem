package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.DBUtil;
import model.NotAllowCourse;

public class NotAllowCourseDao {
	// 增加禁选课程信息
	public static boolean addNotAllowCourse(NotAllowCourse notAllowCourse) {
		Connection conn = DBUtil.getConnection();
		try {
			String sql = "insert into notallowcourse (number, profession, course) values (? ,? ,?)";
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, notAllowCourse.getNumber());
			ptmt.setInt(2, notAllowCourse.getProfession().getNumber());
			ptmt.setInt(3, notAllowCourse.getCourse().getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("增加禁选课程信息失败");
			return false;
		}
	}

	// 修改禁选课程信息
	public static boolean updateNotAllowCourse(NotAllowCourse notAllowCourse) {
		Connection conn = DBUtil.getConnection();
		String sql = "update notallowcourse set profession = ? , course = ? where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, notAllowCourse.getProfession().getNumber());
			ptmt.setInt(2, notAllowCourse.getCourse().getNumber());
			ptmt.setInt(3, notAllowCourse.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("修改禁选课程信息失败");
			return false;
		}
	}

	// 删除禁选课程信息
	public static boolean delNotAllowCourse(NotAllowCourse notAllowCourse) {
		Connection conn = DBUtil.getConnection();
		String sql = "delete from notallowcourse where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, notAllowCourse.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("删除禁选课程信息失败");
			return false;
		}
	}

	// 初始加载禁选课程信息
	public static boolean loadNotAllowCourse() {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from notallowcourse";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				new NotAllowCourse(rs.getInt("number"), rs.getInt("profession"), rs.getInt("course"));
			}
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("禁选课程信息加载失败");
			return false;
		}
	}
}
