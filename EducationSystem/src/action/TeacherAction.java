package action;

import model.Teacher;

public class TeacherAction {

	public static Teacher login(int id, String password, int i) {
		if (i == 0) {
			for (Teacher t : Teacher.getTeacherList()) {
				if (t.getNumber() == id && t.getPassword().equals(password) && t.isJiaoWu()) {
					return t;
				}
			}
			return null;
		} else {
			for (Teacher t : Teacher.getTeacherList()) {
				if (t.getNumber() == id && t.getPassword().equals(password) && !t.isJiaoWu()) {
					return t;
				}
			}
			return null;
		}
	}
}
