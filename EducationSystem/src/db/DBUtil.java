package db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

	private static final String driver = "com.mysql.jdbc.Driver";
//	private static final String URL = "jdbc:mysql://120.27.109.18:3306/jwxt";
	private static final String URL = "jdbc:mysql://localhost:3306/jwxt";
	private static final String USER = "root";
	private static final String PASSWORD = "football2531!!!";
	private static Connection conn = null;

	//使用静态初始化块在该类被调用的时候就创建一个Connection对象
	static {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
	}

	//单例模式中获得唯一数据库连接对象
	public static Connection getConnection() {
		if (conn == null) {
			try {
				conn = DriverManager.getConnection(URL, USER, PASSWORD);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return conn;
	}

	//关闭数据库
	public static void closeConnection() {
		try {
			conn.close();
			System.out.println("数据库连接关闭成功");
		} catch (SQLException e) {
			System.out.println("数据库连接关闭失败");
			e.printStackTrace();
		}
	}
	
}
