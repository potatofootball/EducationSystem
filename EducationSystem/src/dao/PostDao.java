package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import db.DBUtil;
import model.Post;

public class PostDao {

	// 增加职务信息
	public static boolean addPost(Post post) {
		Connection conn = DBUtil.getConnection();
		try {
			String sql = "insert into post (number, name) values (?, ?)";
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, post.getNumber());
			ptmt.setString(2, post.getName());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("增加职务信息失败");
			return false;
		}
	}

	// 修改职务信息
	public static boolean updatePost(Post post) {
		Connection conn = DBUtil.getConnection();
		String sql = "update post set name = ? where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setString(1, post.getName());
			ptmt.setInt(2, post.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("修改职务信息失败");
			return false;
		}
	}

	// 删除职务信息
	public static boolean delPost(Post post) {
		Connection conn = DBUtil.getConnection();
		String sql = "delete from post where number = ?";
		try {
			PreparedStatement ptmt = conn.prepareStatement(sql);
			ptmt.setInt(1, post.getNumber());
			ptmt.execute();
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("删除职务信息失败");
			return false;
		}
	}

	// 初始加载职务信息
	public static boolean loadPost() {
		Connection conn = DBUtil.getConnection();
		String sql = "select * from post";
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(sql);
			while (rs.next()) {
				new Post(rs.getInt("number"), rs.getString("name"));
			}
			return true;
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("职务信息加载失败");
			return false;
		}
	}

}
