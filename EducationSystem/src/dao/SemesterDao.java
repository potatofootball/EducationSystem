package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;

import db.DBUtil;
import model.Semester;

public class SemesterDao {

	// 增加学期信息
	public static boolean addSemester(Semester semester) {
		Connection conn = DBUtil.getConnection();
		try {
			String sql = "insert into semester (number, startyear, overyear, semester, thissemester) values (?, ?, ?, ?, ?)";
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, semester.getNumber());
			ptmt.setInt(2, semester.getStartYear());
			ptmt.setInt(3, semester.getOverYear());
			ptmt.setInt(4, semester.getSemester());
			if (semester.isThisSemester()) {
				ptmt.setInt(5, 1);
			} else {
				ptmt.setNull(5, Types.TINYINT);
			}
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("增加学期信息失败");
			return false;
		}
	}

	// 修改学期信息
	public static boolean updateSemester(Semester semester) {
		Connection conn = DBUtil.getConnection();
		String sql = "update semester set startyear = ? , overyear = ? , semester = ? , thissemester = ? where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, semester.getStartYear());
			ptmt.setInt(2, semester.getOverYear());
			ptmt.setInt(3, semester.getSemester());
			if (semester.isThisSemester()) {
				ptmt.setInt(4, 1);
			} else {
				ptmt.setNull(4, Types.TINYINT);
			}
			ptmt.setInt(5, semester.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("修改学期信息失败");
			return false;
		}
	}

	// 删除学期信息
	public static boolean delSemester(Semester semester) {
		Connection conn = DBUtil.getConnection();
		String sql = "delete from semester where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, semester.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("删除学期信息失败");
			return false;
		}
	}

	// 初始加载学期信息
	public static boolean loadSemester() {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from semester";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				if (rs.getInt("thissemester") == 1) {
					new Semester(rs.getInt("number"), rs.getInt("startyear"), rs.getInt("overyear"),
							rs.getInt("semester"), true);
				} else {
					new Semester(rs.getInt("number"), rs.getInt("startyear"), rs.getInt("overyear"),
							rs.getInt("semester"), false);
				}
			}
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("学期信息加载失败");
			return false;
		}
	}

}
