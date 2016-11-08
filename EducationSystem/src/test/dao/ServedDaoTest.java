package test.dao;

import dao.CollegeDao;
import dao.PostDao;
import dao.ProfessionDao;
import dao.ServedDao;
import dao.TeacherDao;
import dao.TitleDao;
import db.DBUtil;
import model.College;
import model.Post;
import model.Served;

public class ServedDaoTest {

	public static void main(String[] args) {
		CollegeDao.loadCollege();
		ProfessionDao.loadProfession();
		TitleDao.loadTitle();
		TeacherDao.loadTeacher();
		PostDao.loadPost();
		ServedDao.loadServed();
		// 加载任职信息

		int i = 1;
		for (College college : College.getCollegeList()) {
			ServedDao.addServed(new Served(i, college.getNumber() * 1000 + 1, 1));
			i++;
		}
		// 添加测试数据

		Served s = new Served(1, 1001, 1);
		ServedDao.addServed(s);
		// 测试添加任职

		s.setPost(Post.searchPost(2));
		ServedDao.updateServed(s);
		// 测试修改数据

		ServedDao.delServed(s);
		// 测试删除任职

		for (Served served : Served.getServedList()) {
			System.out.println(served.toString());
		}
		// 遍历输出任职对象
		DBUtil.closeConnection();
		// 关闭数据库连接
	}

}
