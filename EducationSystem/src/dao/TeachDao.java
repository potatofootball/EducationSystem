package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.DBUtil;
import model.Teach;

public class TeachDao {

	// 增加任课信息
	public static boolean addTeach(Teach teach) {
		Connection conn = DBUtil.getConnection();
		try {
			String sql = "insert into teach (number, teacher, course, classroom, credit, capacity, choose, classtime, socreconfirm, semester) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, teach.getNumber());
			ptmt.setInt(2, teach.getTeacher().getNumber());
			ptmt.setInt(3, teach.getCourse().getNumber());
			ptmt.setInt(4, teach.getClassroom().getNumber());
			ptmt.setInt(5, teach.getCredit());
			ptmt.setInt(6, teach.getCapacity());
			ptmt.setInt(7, teach.getChoose());
			ptmt.setInt(8, teach.getClassTime().getNumber());
			if (teach.isSocreConfirm()) {
				ptmt.setInt(9, 0);
			} else {
				ptmt.setInt(9, 1);
			}
			ptmt.setInt(10, teach.getSemester().getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("增加任课信息失败");
			return false;
		}
	}

	// 修改任课信息
	public static boolean updateTeach(Teach teach) {
		Connection conn = DBUtil.getConnection();
		String sql = "update teach set teacher = ? , course = ? , classroom = ? "
				+ ", credit = ? , capacity = ? , choose = ? , classtime = ? , socreconfirm = ? "
				+ ", semester = ? where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, teach.getTeacher().getNumber());
			ptmt.setInt(2, teach.getCourse().getNumber());
			ptmt.setInt(3, teach.getClassroom().getNumber());
			ptmt.setInt(4, teach.getCredit());
			ptmt.setInt(5, teach.getCapacity());
			ptmt.setInt(6, teach.getChoose());
			ptmt.setInt(7, teach.getClassTime().getNumber());
			if (teach.isSocreConfirm()) {
				ptmt.setInt(8, 0);
			} else {
				ptmt.setInt(8, 1);
			}
			ptmt.setInt(9, teach.getSemester().getNumber());
			ptmt.setInt(10, teach.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("修改任课信息失败");
			return false;
		}
	}

	// 删除任课信息
	public static boolean delTeach(Teach teach) {
		Connection conn = DBUtil.getConnection();
		String sql = "delete from teach where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, teach.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("删除任课信息失败");
			return false;
		}
	}

	// 初始加载任课信息
	public static boolean loadTeach() {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from teach";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				new Teach(rs.getInt("number"), rs.getInt("teacher"), rs.getInt("course"), rs.getInt("classroom"),
						rs.getInt("credit"), rs.getInt("capacity"), rs.getInt("choose"), rs.getInt("classtime"),
						rs.getInt("socreconfirm"), rs.getInt("semester"));
			}
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("任课信息加载失败");
			return false;
		}
	}

}
