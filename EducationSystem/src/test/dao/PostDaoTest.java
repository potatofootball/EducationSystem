package test.dao;

import dao.PostDao;
import db.DBUtil;
import model.Post;

public class PostDaoTest {

	public static void main(String[] args) {

		PostDao.loadPost();
		// 加载职务信息

		for (int i = 1; i < 11; i++) {
			PostDao.addPost(new Post(i, "职务" + i));
		}
		// 添加测试数据

		 Post p = new Post(1, "院长");
		 PostDao.addPost(p);
		// 测试添加职务

		 p.setName("清洁工");
		 PostDao.updatePost(p);
		// 测试修改数据

		 PostDao.delPost(p);
		// 测试删除职务

		for (Post post : Post.getPostList()) {
			System.out.println(post.toString());
		}
		// 遍历输出职务对象
		DBUtil.closeConnection();
		// 关闭数据库连接
	}

}
