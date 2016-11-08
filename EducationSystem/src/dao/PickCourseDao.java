package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.DBUtil;
import model.PickCourse;

public class PickCourseDao {
	// 增加选课信息
	public static boolean addPickCourse(PickCourse pickCourse) {
		Connection conn = DBUtil.getConnection();
		try {
			String sql = "insert into pickcourse (number, teach, student, score) values (?, ? ,? ,?)";
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, pickCourse.getNumber());
			ptmt.setInt(2, pickCourse.getTeach().getNumber());
			ptmt.setInt(3, pickCourse.getStudent().getNumber());
			ptmt.setFloat(4, pickCourse.getScore());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("增加选课信息失败");
			return false;
		}
	}

	// 修改选课信息
	public static boolean updatePickCourse(PickCourse pickCourse) {
		Connection conn = DBUtil.getConnection();
		String sql = "update pickcourse set teach = ? , student = ? , score = ? where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, pickCourse.getTeach().getNumber());
			ptmt.setInt(2, pickCourse.getStudent().getNumber());
			ptmt.setFloat(3, pickCourse.getScore());
			ptmt.setInt(4, pickCourse.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("修改选课信息失败");
			return false;
		}
	}

	// 删除选课信息
	public static boolean delPickCourse(PickCourse pickCourse) {
		return delPickCourse(pickCourse.getNumber());
	}

	public static boolean delPickCourse(int pickCourse) {
		Connection conn = DBUtil.getConnection();
		String sql = "delete from pickcourse where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, pickCourse);
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("删除选课信息失败");
			return false;
		}
	}

	// 初始加载选课信息
	public static boolean loadPickCourse() {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from pickcourse";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				new PickCourse(rs.getInt("number"), rs.getInt("teach"), rs.getInt("student"), rs.getFloat("score"));
			}
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("选课信息加载失败");
			return false;
		}
	}
}
