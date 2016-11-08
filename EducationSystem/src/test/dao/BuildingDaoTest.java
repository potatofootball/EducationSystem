package test.dao;

import dao.BuildingDao;
import dao.ClassAreaDao;
import db.DBUtil;
import model.Building;
import model.ClassArea;

public class BuildingDaoTest {

	public static void main(String[] args) {
		ClassAreaDao.loadClassArea();
		BuildingDao.loadBuilding();
		// 加载教学楼信息

		int j = 1;
		for (ClassArea ca : ClassArea.getClassAreaList()) {
			for (int i = 1; i < 6; i++, j++) {
				BuildingDao.addBuilding(new Building(ca.getNumber() * 100 + i, "教学楼" + j, ca.getNumber()));
			}
		}
		// 添加测试数据

		Building b = new Building(1, "教学楼", 1);
		BuildingDao.addBuilding(b);
		// 测试添加教学楼

		b.setName("胶靴");
		BuildingDao.updateBuilding(b);
		// 测试修改数据

		BuildingDao.delBuilding(b);
		// 测试删除教学楼

		for (Building building : Building.getBuildingList()) {
			System.out.println(building.toString());
		}
		// 遍历输出教学楼对象
		DBUtil.closeConnection();
		// 关闭数据库连接

	}

}
