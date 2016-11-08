package test.dao;

import dao.BuildingDao;
import dao.ClassAreaDao;
import dao.ClassroomDao;
import db.DBUtil;
import model.Building;
import model.Classroom;

public class ClassroomDaoTest {

	public static void main(String[] args) {
		ClassAreaDao.loadClassArea();
		BuildingDao.loadBuilding();
		ClassroomDao.loadClassroom();
		// 加载教师信息

		for (Building building : Building.getBuildingList()) {
			for (int floor = 1; floor < 4; floor++) {
				for (int room = 1; room < 6; room++) {
					ClassroomDao.addClassroom(new Classroom(building.getNumber() * 10000 + floor * 100 + room,
							building.getName() + (floor * 100 + room), building.getNumber(), 100));
				}
			}
		}
		// 添加测试数据

		Classroom c = new Classroom(1, "教师", 101, 100);
		ClassroomDao.addClassroom(c);
		// 测试添加教师

		c.setName("教室");
		ClassroomDao.updateClassroom(c);
		// 测试修改数据

		ClassroomDao.delClassroom(c);
		// 测试删除教师

		for (Classroom classroom : Classroom.getClassroomList()) {
			System.out.println(classroom.toString());
		}
		// 遍历输出教师对象
		DBUtil.closeConnection();
		// 关闭数据库连接
	}

}
