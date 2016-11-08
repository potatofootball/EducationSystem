package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.DBUtil;
import model.Class;

public class ClassDao {

	// 增加班级信息
	public static boolean addClass(Class aClass) {
		Connection conn = DBUtil.getConnection();
		try {
			String sql = "insert into class (number, name, profession, year) values (?, ? ,? ,?)";
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, aClass.getNumber());
			ptmt.setString(2, aClass.getName());
			ptmt.setInt(3, aClass.getProfession().getNumber());
			ptmt.setInt(4, aClass.getYear());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("增加班级信息失败");
			return false;
		}
	}

	// 修改班级信息
	public static boolean updateClass(Class aClass) {
		Connection conn = DBUtil.getConnection();
		String sql = "update class set name = ? , profession = ? , year = ? where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, aClass.getName());
			ptmt.setInt(2, aClass.getProfession().getNumber());
			ptmt.setInt(3, aClass.getYear());
			ptmt.setInt(4, aClass.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("修改班级信息失败");
			return false;
		}
	}

	// 删除班级信息
	public static boolean delClass(Class aClass) {
		Connection conn = DBUtil.getConnection();
		String sql = "delete from class where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, aClass.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("删除班级信息失败");
			return false;
		}
	}

	// 初始加载班级信息
	public static boolean loadClass() {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from class";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				new Class(rs.getInt("number"), rs.getString("name"), rs.getInt("profession"), rs.getInt("year"));
			}
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("班级信息加载失败");
			return false;
		}
	}
}
