package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.DBUtil;
import model.ClassArea;

public class ClassAreaDao {

	// 增加教学区信息
	public static boolean addClassArea(ClassArea classArea) {
		Connection conn = DBUtil.getConnection();
		try {
			String sql = "insert into classarea (number, name) values (?, ?)";
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, classArea.getNumber());
			ptmt.setString(2, classArea.getName());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("增加教学区信息失败");
			return false;
		}
	}

	// 修改教学区信息
	public static boolean updateClassArea(ClassArea classArea) {
		Connection conn = DBUtil.getConnection();
		String sql = "update classarea set name = ? where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, classArea.getName());
			ptmt.setInt(2, classArea.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("修改教学区信息失败");
			return false;
		}
	}

	// 删除教学区信息
	public static boolean delClassArea(ClassArea classArea) {
		Connection conn = DBUtil.getConnection();
		String sql = "delete from classarea where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, classArea.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("删除教学区信息失败");
			return false;
		}
	}

	// 初始加载教学区信息
	public static boolean loadClassArea() {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from classarea";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				new ClassArea(rs.getInt("number"), rs.getString("name"));
			}
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("教学区信息加载失败");
			return false;
		}
	}

}
