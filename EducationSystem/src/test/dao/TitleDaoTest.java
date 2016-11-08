package test.dao;

import dao.TitleDao;
import db.DBUtil;
import model.Title;

public class TitleDaoTest {

	public static void main(String[] args) {
		TitleDao.loadTitle();
		// 加载职称信息

		for (int i = 1; i < 11; i++) {
			TitleDao.addTitle(new Title(i, "职称" + i));
		}
		// 添加测试数据

		Title t = new Title(1, "教授");
		TitleDao.addTitle(t);
		// 测试添加职称

		t.setName("叫兽");
		TitleDao.updateTitle(t);
		// 测试修改数据

		TitleDao.delTitle(t);
		// 测试删除职称

		for (Title title : Title.getTitleList()) {
			System.out.println(title.toString());
		}
		// 遍历输出职称对象
		DBUtil.closeConnection();
		// 关闭数据库连接
	}

}
