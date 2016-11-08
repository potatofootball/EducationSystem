package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.DBUtil;
import model.AdjustClass;

public class AdjustClassDao {

	// 增加调课信息
	public static boolean addAdjustClass(AdjustClass adjustClass) {
		Connection conn = DBUtil.getConnection();
		try {
			String sql = "insert into adjustclass (number, teach, changefrom, changeto, message, submittime, confirmtime, confirm, allow) values (?, ?, ?, ? ,? ,? ,?, ?, ?)";
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, adjustClass.getNumber());
			ptmt.setInt(2, adjustClass.getTeach().getNumber());
			ptmt.setString(3, adjustClass.getChangeFrom());
			ptmt.setString(4, adjustClass.getChangeTo());
			ptmt.setString(5, adjustClass.getMessage());
			ptmt.setDate(6, new Date(adjustClass.getSubmitTime()));
			ptmt.setDate(7, new Date(adjustClass.getConfirmTime()));
			if (adjustClass.isConfirm()) {
				ptmt.setInt(8, 0);
			} else {
				ptmt.setInt(8, 1);
			}
			if (adjustClass.isAllow()) {
				ptmt.setInt(9, 0);
			} else {
				ptmt.setInt(9, 1);
			}
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("增加调课信息失败");
			return false;
		}
	}

	// 修改调课信息
	public static boolean updateAdjustClass(AdjustClass adjustClass) {
		Connection conn = DBUtil.getConnection();
		String sql = "update adjustclass set teach = ? , changefrom = ? , changeto = ? , message = ? , submittime = ? , confirmtime = ? , confirm = ? , allow = ? where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, adjustClass.getTeach().getNumber());
			ptmt.setString(2, adjustClass.getChangeFrom());
			ptmt.setString(3, adjustClass.getChangeTo());
			ptmt.setString(4, adjustClass.getMessage());
			ptmt.setDate(5, new Date(adjustClass.getSubmitTime()));
			ptmt.setDate(6, new Date(adjustClass.getConfirmTime()));
			if (adjustClass.isConfirm()) {
				ptmt.setInt(7, 0);
			} else {
				ptmt.setInt(7, 1);
			}
			if (adjustClass.isAllow()) {
				ptmt.setInt(8, 0);
			} else {
				ptmt.setInt(8, 1);
			}
			ptmt.setInt(9, adjustClass.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("修改调课信息失败");
			return false;
		}
	}

	// 删除调课信息
	public static boolean delAdjustClass(AdjustClass adjustClass) {
		Connection conn = DBUtil.getConnection();
		String sql = "delete from adjustclass where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, adjustClass.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("删除调课信息失败");
			return false;
		}
	}

	// 初始加载调课信息
	public static boolean loadAdjustClass() {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from adjustclass";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				new AdjustClass(rs.getInt("number"), rs.getInt("teach"), rs.getString("changefrom"),
						rs.getString("changeto"), rs.getString("message"), rs.getDate("submittime").getTime(),
						rs.getDate("confirmtime").getTime(), rs.getInt("confirm"), rs.getInt("allow"));
			}
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("调课信息加载失败");
			return false;
		}
	}
}
