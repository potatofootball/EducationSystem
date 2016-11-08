package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.DBUtil;
import model.Served;

public class ServedDao {

	// 增加担任信息
	public static boolean addServed(Served served) {
		Connection conn = DBUtil.getConnection();
		try {
			String sql = "insert into served (number, teacher, post) values (?, ? ,?)";
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, served.getNumber());
			ptmt.setInt(2, served.getTeacher().getNumber());
			ptmt.setInt(3, served.getPost().getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("增加担任信息失败");
			return false;
		}
	}

	// 修改担任信息
	public static boolean updateServed(Served served) {
		Connection conn = DBUtil.getConnection();
		String sql = "update served set teacher = ? , post = ? where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, served.getTeacher().getNumber());
			ptmt.setInt(2, served.getPost().getNumber());
			ptmt.setInt(3, served.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("修改担任信息失败");
			return false;
		}
	}

	// 删除担任信息
	public static boolean delServed(Served served) {
		Connection conn = DBUtil.getConnection();
		String sql = "delete from served where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, served.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("删除担任信息失败");
			return false;
		}
	}

	// 初始加载担任信息
	public static boolean loadServed() {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from served";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				new Served(rs.getInt("number"), rs.getInt("teacher"), rs.getInt("post"));
			}
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("担任信息加载失败");
			return false;
		}
	}

}
