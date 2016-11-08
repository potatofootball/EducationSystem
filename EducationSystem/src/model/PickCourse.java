package model;

import java.util.ArrayList;
import java.util.List;

public class PickCourse {

	private int number;
	private Teach teach;
	private Student student;
	private float score;

	private static List<PickCourse> pickCourseList = new ArrayList<PickCourse>();

	public PickCourse(int number, int teach, int student, float score) {
		this.number = number;
		this.teach = Teach.searchTeach(teach);
		this.student = Student.searchStudent(student);
		this.student.addPickCourse(this);
		this.score = score;
		this.teach.getPickCourseList().add(this);
		pickCourseList.add(this);
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public Teach getTeach() {
		return teach;
	}

	public void setTeach(Teach teach) {
		this.teach = teach;
	}

	public Student getStudent() {
		return student;
	}

	public void setStudent(Student student) {
		this.student = student;
	}

	public float getScore() {
		return score;
	}

	public void setScore(float score) {
		this.score = score;
	}

	public static List<PickCourse> getPickCourseList() {
		return pickCourseList;
	}

	// 删除选课
	public static void removePickCourse(PickCourse pickCourse) {
		if (pickCourse != null) {
			if (pickCourseList.contains(pickCourse)) {
				pickCourseList.remove(pickCourse);
			}
		}
		pickCourse = null;
	}

	// 通过编号搜索选课
	public static PickCourse searchPickCourse(int number) {
		for (PickCourse pickCourse : pickCourseList) {
			if (pickCourse.getNumber() == number)
				return pickCourse;
		}
		return null;
	}

	// 通过课程搜索选课
	public static List<Student> searchPickCourse(Teach teach) {
		List<Student> list = new ArrayList<Student>();
		for (PickCourse pickCourse : pickCourseList) {
			if (pickCourse.getTeach().equals(teach))
				list.add(pickCourse.getStudent());
		}
		return list;
	}
}
