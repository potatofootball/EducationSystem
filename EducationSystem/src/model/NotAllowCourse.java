package model;

import java.util.ArrayList;
import java.util.List;

public class NotAllowCourse {

	private int number;
	private Profession profession;
	private Course course;

	private static List<NotAllowCourse> notAllowCourseList = new ArrayList<NotAllowCourse>();

	public NotAllowCourse(int number, int profession, int course) {
		this.number = number;
		this.profession = Profession.searchProfession(profession);
		this.course = Course.searchCourse(course);
		notAllowCourseList.add(this);
	}

	public int getNumber() {
		return number;
	}

	public void setNumber(int number) {
		this.number = number;
	}

	public Profession getProfession() {
		return profession;
	}

	public void setProfession(Profession profession) {
		this.profession = profession;
	}

	public Course getCourse() {
		return course;
	}

	public void setCourse(Course course) {
		this.course = course;
	}

	public static List<NotAllowCourse> getNotAllowCourseList() {
		return notAllowCourseList;
	}

	// 删除禁选课程
	public static void removeNotAllowCourse(NotAllowCourse NotAllowCourse) {
		if (NotAllowCourse != null) {
			if (notAllowCourseList.contains(NotAllowCourse)) {
				notAllowCourseList.remove(NotAllowCourse);
			}
		}
		NotAllowCourse = null;
	}

	// 通过编号搜索禁选课程
	public static NotAllowCourse searchNotAllowCourse(int number) {
		for (NotAllowCourse notAllowCourse : notAllowCourseList) {
			if (notAllowCourse.getNumber() == number)
				return notAllowCourse;
		}
		return null;
	}

	// 通过专业搜索禁选课程
	public static List<Course> searchNotAllowCourse(Profession profession) {
		List<Course> list = new ArrayList<Course>();
		for (NotAllowCourse notAllowCourse : notAllowCourseList) {
			if (notAllowCourse.getProfession().equals(profession))
				list.add(notAllowCourse.getCourse());
		}
		return list;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + number;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		NotAllowCourse other = (NotAllowCourse) obj;
		if (number != other.number)
			return false;
		return true;
	}

}
