package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.DBUtil;
import model.Building;

public class BuildingDao {

	// 增加教学楼信息
	public static boolean addBuilding(Building building) {
		Connection conn = DBUtil.getConnection();
		try {
			String sql = "insert into building (number, name, classarea) values (?, ?, ?)";
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, building.getNumber());
			ptmt.setString(2, building.getName());
			ptmt.setInt(3, building.getClassArea().getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("增加教学楼信息失败");
			return false;
		}
	}

	// 修改教学楼信息
	public static boolean updateBuilding(Building building) {
		Connection conn = DBUtil.getConnection();
		String sql = "update building set name = ? , classarea = ? where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, building.getName());
			ptmt.setInt(2, building.getClassArea().getNumber());
			ptmt.setInt(3, building.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("修改教学楼信息失败");
			return false;
		}
	}

	// 删除教学楼信息
	public static boolean delBuilding(Building building) {
		Connection conn = DBUtil.getConnection();
		String sql = "delete from building where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, building.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("删除教学楼信息失败");
			return false;
		}
	}

	// 初始加载教学楼信息
	public static boolean loadBuilding() {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from building";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				new Building(rs.getInt("number"), rs.getString("name"), rs.getInt("classarea"));
			}
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("教学楼信息加载失败");
			return false;
		}
	}

}
