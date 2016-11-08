package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.DBUtil;
import model.Teacher;

public class TeacherDao {

	// 增加教师信息
	public static boolean addTeacher(Teacher teacher) {
		Connection conn = DBUtil.getConnection();
		try {
			String sql = "insert into teacher (number, name, password, gender, birthday,"
					+ " college, profession, title, isjiaowu) values (?, ?, ?, ?, ?, ? ,? ,? ,?)";
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, teacher.getNumber());
			ptmt.setString(2, teacher.getName());
			ptmt.setString(3, teacher.getPassword());
			ptmt.setString(4, teacher.getGender());
			ptmt.setDate(5, new Date(teacher.getBirthday()));
			ptmt.setInt(6, teacher.getCollege().getNumber());
			ptmt.setInt(7, teacher.getProfession().getNumber());
			ptmt.setInt(8, teacher.getTitle().getNumber());
			if (teacher.isJiaoWu()) {
				ptmt.setInt(9, 0);
			} else {
				ptmt.setInt(9, 1);
			}
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("增加教师信息失败");
			return false;
		}
	}

	// 修改教师信息
	public static boolean updateTeacher(Teacher teacher) {
		Connection conn = DBUtil.getConnection();
		String sql = "update teacher set name = ? , password = ? , gender = ? , birthday = ? ,"
				+ " college = ? , profession = ? , title = ? , isjiaowu = ? where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, teacher.getName());
			ptmt.setString(2, teacher.getPassword());
			ptmt.setString(3, teacher.getGender());
			ptmt.setDate(4, new Date(teacher.getBirthday()));
			ptmt.setInt(5, teacher.getCollege().getNumber());
			ptmt.setInt(6, teacher.getProfession().getNumber());
			ptmt.setInt(7, teacher.getTitle().getNumber());
			if (teacher.isJiaoWu()) {
				ptmt.setInt(8, 0);
			} else {
				ptmt.setInt(8, 1);
			}
			ptmt.setInt(9, teacher.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("修改教师信息失败");
			return false;
		}
	}

	// 删除教师信息
	public static boolean delTeacher(Teacher teacher) {
		Connection conn = DBUtil.getConnection();
		String sql = "delete from teacher where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, teacher.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("删除教师信息失败");
			return false;
		}
	}

	// 初始加载教师信息
	public static boolean loadTeacher() {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from teacher";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				new Teacher(rs.getInt("number"), rs.getString("name"), rs.getString("password"), rs.getString("gender"),
						rs.getDate("birthday").getTime(), rs.getInt("college"), rs.getInt("profession"),
						rs.getInt("title"), rs.getInt("isjiaowu"));
			}
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("教师信息加载失败");
			return false;
		}
	}

}
