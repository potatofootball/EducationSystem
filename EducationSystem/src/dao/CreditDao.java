package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.DBUtil;
import model.Credit;

public class CreditDao {

	// 增加学分要求信息
	public static boolean addCredit(Credit credit) {
		Connection conn = DBUtil.getConnection();
		try {
			String sql = "insert into credit (number, profession, coursetype, credit) values (?, ?, ?, ?)";
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, credit.getNumber());
			ptmt.setInt(2, credit.getProfession().getNumber());
			ptmt.setInt(3, credit.getCourseType().getNumber());
			ptmt.setInt(4, credit.getCredit());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("增加学分要求信息失败");
			return false;
		}
	}

	// 修改学分要求信息
	public static boolean updateCredit(Credit credit) {
		Connection conn = DBUtil.getConnection();
		String sql = "update credit set profession = ? , coursetype = ? , credit = ? where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, credit.getProfession().getNumber());
			ptmt.setInt(2, credit.getCourseType().getNumber());
			ptmt.setInt(3, credit.getCredit());
			ptmt.setInt(4, credit.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("修改学分要求信息失败");
			return false;
		}
	}

	// 删除学分要求信息
	public static boolean delCredit(Credit credit) {
		Connection conn = DBUtil.getConnection();
		String sql = "delete from credit where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, credit.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("删除学分要求信息失败");
			return false;
		}
	}

	// 初始加载学分要求信息
	public static boolean loadCredit() {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from credit";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				new Credit(rs.getInt("number"), rs.getInt("profession"), rs.getInt("coursetype"), rs.getInt("credit"));
			}
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("学分要求信息加载失败");
			return false;
		}
	}

}
