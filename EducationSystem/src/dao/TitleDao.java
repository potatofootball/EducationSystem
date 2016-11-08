package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.DBUtil;
import model.Title;

public class TitleDao {

	// 增加职称信息
	public static boolean addTitle(Title title) {
		Connection conn = DBUtil.getConnection();
		try {
			String sql = "insert into title (number, name) values (?, ?)";
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, title.getNumber());
			ptmt.setString(2, title.getName());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("增加职称信息失败");
			return false;
		}
	}

	// 修改职称信息
	public static boolean updateTitle(Title title) {
		Connection conn = DBUtil.getConnection();
		String sql = "update title set name = ? where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, title.getName());
			ptmt.setInt(2, title.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("修改职称信息失败");
			return false;
		}
	}

	// 删除职称信息
	public static boolean delTitle(Title title) {
		Connection conn = DBUtil.getConnection();
		String sql = "delete from title where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, title.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("删除职称信息失败");
			return false;
		}
	}

	// 初始加载职称信息
	public static boolean loadTitle() {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from title";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				new Title(rs.getInt("number"), rs.getString("name"));
			}
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("职称信息加载失败");
			return false;
		}
	}

}
