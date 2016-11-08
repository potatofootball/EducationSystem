package action;

import dao.PickCourseDao;
import model.PickCourse;

public class PickCourseAction {

	public static void calcelPickCourse(int number) {
		PickCourseDao.delPickCourse(number);
		PickCourse p = PickCourse.searchPickCourse(number);
		p.getStudent().getPickCourseList().remove(p);
		PickCourse.getPickCourseList().remove(p);
	}

	public static void addPickCourse(PickCourse pickCourse) {
		PickCourseDao.addPickCourse(pickCourse);
	}

	public static int getMaxNumber() {
		return PickCourse.getPickCourseList().get(PickCourse.getPickCourseList().size() - 1).getNumber();
	}
}
