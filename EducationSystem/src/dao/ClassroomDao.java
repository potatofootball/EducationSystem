package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.DBUtil;
import model.Classroom;

public class ClassroomDao {

	// 增加教室信息
	public static boolean addClassroom(Classroom classroom) {
		Connection conn = DBUtil.getConnection();
		try {
			String sql = "insert into classroom (number, name, building, capacity) values (?, ?, ?, ?)";
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, classroom.getNumber());
			ptmt.setString(2, classroom.getName());
			ptmt.setInt(3, classroom.getBuilding().getNumber());
			ptmt.setInt(4, classroom.getCapacity());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("增加教室信息失败");
			return false;
		}
	}

	// 修改教室信息
	public static boolean updateClassroom(Classroom classroom) {
		Connection conn = DBUtil.getConnection();
		String sql = "update classroom set name = ? , building = ? , capacity = ? where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, classroom.getName());
			ptmt.setInt(2, classroom.getBuilding().getNumber());
			ptmt.setInt(3, classroom.getCapacity());
			ptmt.setInt(4, classroom.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("修改教室信息失败");
			return false;
		}
	}

	// 删除教室信息
	public static boolean delClassroom(Classroom classroom) {
		Connection conn = DBUtil.getConnection();
		String sql = "delete from classroom where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, classroom.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("删除教室信息失败");
			return false;
		}
	}

	// 初始加载教室信息
	public static boolean loadClassroom() {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from classroom";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				new Classroom(rs.getInt("number"), rs.getString("name"), rs.getInt("building"), rs.getInt("capacity"));
			}
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("教室信息加载失败");
			return false;
		}
	}
}
