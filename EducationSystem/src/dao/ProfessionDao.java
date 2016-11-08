package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.DBUtil;
import model.Profession;

public class ProfessionDao {

	// 增加专业信息
	public static boolean addProfession(Profession profession) {
		Connection conn = DBUtil.getConnection();
		try {
			String sql = "insert into profession (number, name, college) values (?, ?, ?)";
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, profession.getNumber());
			ptmt.setString(2, profession.getName());
			ptmt.setInt(3, profession.getCollege().getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("增加专业信息失败");
			return false;
		}
	}

	// 修改专业信息
	public static boolean updateProfession(Profession profession) {
		Connection conn = DBUtil.getConnection();
		String sql = "update profession set name = ? , college = ? where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, profession.getName());
			ptmt.setInt(2, profession.getCollege().getNumber());
			ptmt.setInt(3, profession.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("修改专业信息失败");
			return false;
		}
	}

	// 删除专业信息
	public static boolean delProfession(Profession profession) {
		Connection conn = DBUtil.getConnection();
		String sql = "delete from profession where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, profession.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("删除专业信息失败");
			return false;
		}
	}

	// 初始加载专业信息
	public static boolean loadProfession() {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from profession";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				new Profession(rs.getInt("number"), rs.getString("name"), rs.getInt("college"));
			}
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("专业信息加载失败");
			return false;
		}
	}

}
