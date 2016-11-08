package action;

import model.Student;

public class StudentAction {
	public static Student login(int id, String password) {
		for (Student s : Student.getStudentList()) {
			if (s.getNumber() == id && s.getPassword().equals(password)) {
				return s;
			}
		}
		return null;
	}
}
