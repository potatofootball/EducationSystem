package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.DBUtil;
import model.Student;

public class StudentDao {

	// 增加学生信息
	public static boolean addStudent(Student student) {
		Connection conn = DBUtil.getConnection();
		try {
			String sql = "insert into student (number, name, password, class, gender, birthday, pickcoursepower) values (?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, student.getNumber());
			ptmt.setString(2, student.getName());
			ptmt.setString(3, student.getPassword());
			ptmt.setInt(4, student.getTheClass().getNumber());
			ptmt.setString(5, student.getGender());
			ptmt.setDate(6, new java.sql.Date(student.getBirthday()));
			if (student.isPickCoursePower()) {
				ptmt.setInt(7, 0);
			} else {
				ptmt.setInt(7, 1);
			}
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("增加学生信息失败");
			return false;
		}
	}

	// 修改学生信息
	public static boolean updateStudent(Student student) {
		Connection conn = DBUtil.getConnection();
		String sql = "update student set name = ?, password = ? , class = ? , gender = ? , birthday = ? , pickcoursepower = ? where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, student.getName());
			ptmt.setString(2, student.getPassword());
			ptmt.setInt(3, student.getTheClass().getNumber());
			ptmt.setString(4, student.getGender());
			ptmt.setDate(5, new java.sql.Date(student.getBirthday()));
			if (student.isPickCoursePower()) {
				ptmt.setInt(6, 0);
			} else {
				ptmt.setInt(6, 1);
			}
			ptmt.setInt(7, student.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("修改学生信息失败");
			return false;
		}
	}

	// 删除学生信息
	public static boolean delStudent(Student student) {
		Connection conn = DBUtil.getConnection();
		String sql = "delete from student where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, student.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("删除学生信息失败");
			return false;
		}
	}

	// 初始加载学生信息
	public static boolean loadStudent() {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from student";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				new Student(rs.getInt("number"), rs.getString("name"), rs.getString("password"), rs.getInt("class"), rs.getString("gender"),
						rs.getDate("birthday").getTime(), rs.getInt("pickcoursepower"));
			}
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("学生信息加载失败");
			return false;
		}
	}

}
